class TipsController < ApplicationController
    before_action :logged_in_user,only: [:create,:destroy]
    
    def new
        @user = current_user
        @tip = @user.tips.new
        @reason = @tip.reasons.new
    end
    
    def create
        @user = current_user
        ActiveRecord::Base.transaction do
            @tip = @user.tips.build(tip_params)
            # @tip.user = current_user
            @tip.save!
            flash[:success] = "tipを投稿しました。"
            redirect_to @user
        rescue => e 
            render 'new'
        end
    end
    
    def destroy
    
    end
    
    def tip_params
        params.require(:tip).permit(:content,reasons_attributes:[:id,:content,:_destroy])
    end
end
