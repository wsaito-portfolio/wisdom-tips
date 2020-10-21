class Tip < ApplicationRecord
  has_many :reasons, dependent: :destroy
  has_many :likes
  belongs_to :shelf, optional: true
  belongs_to :tip, optional: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id,presence: true
  validates :content,presence: true,length: {maximum: 100}
  validates :reasons, length: { minimum: 1 }
  accepts_nested_attributes_for :reasons,allow_destroy: true
  
  #検索用scope
  scope :search, ->(search) {where('content LIKE(?)', "%#{search}%")}

end
