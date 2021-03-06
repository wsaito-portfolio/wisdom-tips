class User < ApplicationRecord
    has_many :tips
    has_many :shelves
    has_one :user_detail,dependent:   :destroy
    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    attr_accessor :remember_token, :activation_token, :reset_token
    has_many :following, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    has_many :likes,dependent:   :destroy
    before_save { email.downcase!}
    before_create :create_activation_digest
    accepts_nested_attributes_for :user_detail,allow_destroy: true
    
    validates :name,presence: true,length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence: true,length: {maximum:255},
                format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
                
    has_secure_password
    validates :password, length: {minimum: 6},presence: true,allow_nil: true
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost) 
    end
    
    def User.new_token
       SecureRandom.urlsafe_base64 
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end
    
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token) 
    end
    
    def forget
        update_attribute(:remember_digest,nil) 
    end
    
    # アカウントを有効にする
    def activate
        update_columns(activated: true,activated_at: Time.zone.now)
    end
    
    # 有効化用のメールを送信する
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end
    
    #パスワード再設定の属性を設定する
    def create_reset_digest
        self.reset_token = User.new_token
        update_columns(reset_digest: User.digest(reset_token),reset_sent_at: Time.zone.now)
    end
    
    #パスワード再設定用のメールを送信する。
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
    
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    
     # ユーザーのステータスフィードを返す
    def feed
        following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
        Tip.where("user_id IN (#{following_ids})  OR user_id = :user_id", user_id: id).where(delete_flg: false).limit(20)
    end
    
    def add_feed(offset)
        following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
        Tip.where("user_id IN (#{following_ids})  OR user_id = :user_id", user_id: id).where(delete_flg: false).limit(20).offset(offset.to_i)
    end
    
      # ユーザーをフォローする
    def follow(other_user)
        following << other_user
    end
    
    # ユーザーをフォロー解除する
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end
    
    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
        following.include?(other_user)
    end
    
    def self.search(search)
        return User.all unless search
        Sample.where('name LIKE(?)', "%#{search}%")
    end
    
    #検索用scope
    scope :search, ->(search) {where('name LIKE(?)', "%#{search}%")}
   
    private
        def downcase_email
            self.email = email.downcase
        end
    
        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end
end
