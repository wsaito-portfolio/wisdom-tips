class ShelvesController < ApplicationController
    before_action :logged_in_user,only: [:new,:create,:destroy,:edit,:update]
    before_action :correct_user_id,only:[:new,:create,:destroy,:edit,:update]
    
    def new
        @user = current_user
        @user_detail = @user.user_detail
        @shelf = Shelf.new
    end
    
    def create
        @user = current_user
        @shelf = @user.shelves.new(shelf_params)
        if @shelf.valid? && @shelf.save
            flash[:success] = "shelfを作成しました。"
            redirect_to current_user
        else
            render 'new'
        end
    end
    
    def edit
        @user = current_user
        @user_detail = @user.user_detail
        @shelf = @user.shelves.find(params[:id])
    end
    
    def show
        @user = User.find(params[:user_id]) 
        @user_detail = @user.user_detail
        if params[:id] === "nil"
            @shelf = Shelf.new(name: "未分類")
            @tips = @user.tips.where(shelf_id: nil).where(delete_flg: false)
        else
            @shelf = @user.shelves.find(params[:id])
            @tips = @user.tips.where(shelf_id: params[:id]).where(delete_flg: false)
        end
        render 'show'
    end
    
    def destroy
        @shelf = @user.shelves.find(params[:id])
        deleted_shlef = @shelf.name
        tip = Tip.where(shelf_id: @shelf.id)
        tip.update_all(shelf_id: nil)
        @shelf.destroy
        flash[:success]= deleted_shlef + "を削除しました。"
        redirect_to current_user
    end
    
    def update
        @shelf = @user.shelves.find(params[:id])
        if @shelf.update_attributes(shelf_params)
            flash[:success] = "Shelfを更新しました。"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    private
        def shelf_params
            params.require(:shelf).permit(:name)
        end
    
end
