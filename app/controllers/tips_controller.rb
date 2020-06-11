class TipsController < ApplicationController
    before_action :logged_in_user,only: [:create,:destroy]
    
    def new
        @user = current_user
        @tip = @user.tips.new
        @reason = @tip.reasons.new
        @shelf = @user.shelves
    end
    
    def create
        @user = current_user
        @tip = @user.tips.build(tip_params)
        if @tip.save!
            flash[:success] = "tipを投稿しました。"
            redirect_to current_user
        else
            render 'new'
        end
    end
    
    def destroy
        @tip = Tip.find(params[:id]).destroy
        flash[:success]= "Tipを削除しました。"
        redirect_to current_user
    end
    
    def update
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
        if @tip.update_attributes(tip_params)
          flash[:success] = "Tipを更新しました。"
          redirect_to [@user,@tip]
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
        @shelf = @user.shelves
    end
    
    def tip_params
        params.require(:tip).permit(:content, :shelf_id, reasons_attributes:[:id,:content,:_destroy])
    end
end
