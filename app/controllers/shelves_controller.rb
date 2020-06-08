class ShelvesController < ApplicationController
    
    def new
        @user = current_user
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
        @shelf = @user.shelves.find(params[:id])
    end
    
    def show
        @user = current_user
        #debugger
        if params[:id] === "nil"
            @shelf = Shelf.new(name: "未分類")
            @tips = @user.tips.where(shelf_id: nil)
        else
            @shelf = @user.shelves.find(params[:id])
            @tips = @user.tips.where(shelf_id: params[:id])
        end
        render 
    end
    
    private
        def shelf_params
            params.require(:shelf).permit(:name)
        end
    
end
