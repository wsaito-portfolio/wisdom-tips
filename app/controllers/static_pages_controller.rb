class StaticPagesController < ApplicationController
  def home
    if logged_in?
        @user = current_user
        @user_detail = @user.user_detail
        @feed_items = current_user.feed
        @likes = @user.likes
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
  def auto_load
        @user = current_user
        @feed_items = current_user.add_feed(params[:num])
        @likes = @user.likes
        respond_to do |format|
            format.js
        end
  end
end
