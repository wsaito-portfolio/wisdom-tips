class TipsController < ApplicationController
    before_action :logged_in_user,only: [:create,:destroy]
    
    def new
        @user = current_user
        @tip = @user.tips.new
        @reason = @tip.reasons.new
    end
    
    def create
        @user = current_user
        @tip = @user.tips.build(tip_params)
        if @tip.save!
            flash[:success] = "tipを投稿しました。"
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def destroy
    
    end
    
    def update
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
        if @tip.update_attributes(tip_params)
          flash[:success] = "tipを更新しました。"
          redirect_to @tip
        else
          render 'show'
        end
    end
    
    def show
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
    end
    
    def edit
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
    end
    
    def tip_params
        params.require(:tip).permit(:content,reasons_attributes:[:id,:content,:_destroy])
    end
end
