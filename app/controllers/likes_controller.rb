class LikesController < ApplicationController
    before_action :logged_in_user
    
    def create
        like = Like.new(user_id: params[:user_id], tip_id: params[:tip_id])
        like.save!
        @user = User.find(params[:user_id])
        @tip = Tip.find(params[:tip_id])
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
    
    def destroy
        deleting_like = Like.find(params[:id])
        @user = User.find(deleting_like.user_id)
        @tip = Tip.find(deleting_like.tip_id)
        deleting_like.destroy
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
end
