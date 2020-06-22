class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      @user_detail = @user.user_detail
      @feed_items = current_user.feed
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
end
