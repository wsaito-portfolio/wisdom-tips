class AccountActivationsController < ApplicationController
    
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.activate
            log_in user
            flash[:activate] = "Easy login"
            redirect_to user
        else
            flash[:danger]= "Invalid activation link"
            redirect_to root_url
        end
    end
    
    def tutorial
        respond_to do |format|
            format.js
        end
    end
end
