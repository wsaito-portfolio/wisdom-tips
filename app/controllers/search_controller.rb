class SearchController < ApplicationController
    def index
        @user = current_user
        
        u_search_result = User.search(params[:search]).where(activated: true)
        @users = u_search_result.limit(20)
        @users_count = u_search_result.count
        
        t_search_result = Tip.search(params[:search]).where(delete_flg: false)
        @tips = t_search_result.limit(20)
        @tips_count = t_search_result.count
        @search = params[:search]
        
        if !params[:focus].nil?
            @focus = params[:focus]
        else
            @focus = "tips" 
        end
    end
    
    def auto_load_tips
        @user = current_user
        @tips = Tip.search(params[:search]).limit(20).offset(params[:num])
        respond_to do |format|
            format.js
        end
    end
    
    def auto_load_users
        @user = current_user
        @users = User.search(params[:search]).limit(20).offset(params[:num])
        respond_to do |format|
            format.js
        end
    end
end
