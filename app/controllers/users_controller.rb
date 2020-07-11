class UsersController < ApplicationController
    before_action :logged_in_user,only:[:index,:edit,:update,:destroy,:following,:followers]
    before_action :correct_user,only:[:edit,:update]
    before_action :admin_user,only: :destroy
    
    def index
        @users = User.where(activated: true).paginate(page: params[:page])
    end
    
    def show
        @user = User.find(params[:id])
        @user_detail = @user.user_detail
        @likes = @user.likes
        @tips = @user.tips.where(delete_flg: false)
        redirect_to root_url and return unless @user.activated?
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
            @user.user_detail.update_attributes!(profile_description: user_params[:user_detail_attributes][:profile_description])
            flash[:success] = "Prifile updated"
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
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
    end

    def followers
        @title = "Followers"
        @user    = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
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
