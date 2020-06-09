class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @tips = @user.tips if logged_in? 
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
end
