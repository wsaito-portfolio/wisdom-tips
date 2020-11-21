class UsersController < ApplicationController
    before_action :logged_in_user,only:[:edit,:update,:destroy,:following,:followers,:password]
    before_action :correct_user,only:[:edit,:update]
    before_action :admin_user,only: :destroy
    
    def index
        @users = User.where(activated: true).limit(20)
    end
    
    def show
        @user = User.find(params[:id])
        @user_detail = @user.user_detail
        @likes = @user.likes
        @tips = @user.tips.where(delete_flg: false).limit(20)
        @following = @user.following.where(activated: true).limit(20)
        @followers = @user.followers.where(activated: true).limit(20)
        redirect_to root_url and return unless @user.activated?
        #tutorialのdebug用
        flash[:activate] = "Acount avtivated"
    end
    
    def show_feed
        @user = User.find(params[:id])
        @user_detail = @user.user_detail
        @feed_items = current_user.feed
        redirect_to root_url and return unless @user.activated?
    end
    
    def new
        @user = User.new
    end
    
    
    def create
        @user = User.new(user_params)
        @user_detail = @user.build_user_detail
        ActiveRecord::Base.transaction do
            @user.save!
            @user_detail.save!
            @user.send_activation_email
            flash[:success] = "Please check your email to activate your account."
            redirect_to root_url
        rescue => e
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
        @user_detail = @user.user_detail
    end
    
    def update
        @user = User.find(params[:id])
        ActiveRecord::Base.transaction do
            @user.update_attributes!(user_params)
            if user_params[:user_detail_attributes].nil?
                flash[:success] = "パスワードが変更されました"
            else
                @user.user_detail.update_attributes!(profile_description: user_params[:user_detail_attributes][:profile_description])
                flash[:success] = "プロフィールが変更されました"
            end
            redirect_to @user
        rescue => e
            render 'edit'
        end
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success]= "User deleted"
        redirect_to users_url
    end
    
    def following
        @title = "Following"
        @user    = User.find(params[:id])
        @users = @user.following.where(activated: true).limit(20)
        @user_detail = @user.user_detail
        render 'show_follow'
    end

    def followers
        @title = "Followers"
        @user    = User.find(params[:id])
        @users = @user.followers.where(activated: true).limit(20)
        @user_detail = @user.user_detail
        render 'show_follow'
    end
    
    def password
        @user = User.find(params[:id])
    end
    
    def auto_load
        from = params[:num].to_i + 1
        to   = params[:num].to_i + 20
        @users = User.where(id: from..to).where(activated: true)
        respond_to do |format|
            format.js
        end
    end
    
    def auto_load_followers
        @user = User.find(params[:user_id])
        @users = @user.followers.where(activated: true).limit(20).offset(params[:num])
        respond_to do |format|
            format.js
        end
    end
    
    def auto_load_followings
        @user = User.find(params[:user_id])
        @users = @user.following.where(activated: true).limit(20).offset(params[:num])
        respond_to do |format|
            format.js
        end
    end
    
    private
        def user_params
            params.require(:user).permit(:name,:email,:password,:password_confirmation,user_detail_attributes:[:id,:profile_description])
        end
        
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
        
        def admin_user
            redirect_to(root_url) unless current_user.admin? 
        end
end
