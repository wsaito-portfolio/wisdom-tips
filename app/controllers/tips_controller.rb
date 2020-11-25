class TipsController < ApplicationController
    before_action :logged_in_user,only: [:new,:create,:destroy,:edit,:update,:refer]
    before_action :correct_user_id,only:[:new,:create,:destroy,:edit,:update]
    
    def new
        @user = current_user
        @user_detail = @user.user_detail
        @feed_items = current_user.feed
        @tip = @user.tips.new
        @reason = @tip.reasons.new
        @shelf = @user.shelves
    end
    
    def create
        @user = current_user
        @tip = @user.tips.build(tip_params)
        ActiveRecord::Base.transaction do
            @tip.save!
            flash[:success] = "tipを投稿しました。"
            redirect_to current_user
        rescue => e
            render 'new'
        end
    end
    
    def destroy
        @tip = Tip.find(params[:id]).toggle!(:delete_flg)
        flash[:success]= "Tipを削除しました。"
        redirect_to current_user
    end
    
    def update
        @tip = Tip.find(params[:id])
        @user = User.find(@tip.user_id)
        
        ActiveRecord::Base.transaction do
            #新しいTipを作成
            new_tip = @user.tips.new(tip_params_update)
            new_tip.save!
            
            #古いTipのdeleteフラグを立てる
            @tip.toggle!(:delete_flg)
            
            #2個前以上の古いTipのparentIDを変更
            old_tips = @user.tips.where(parent_id: @tip.id).
            old_tips.update_attributes!(parent_id: new_tip.id)  if !old_tips.nil?
            
            #1個前のTipのparentIDを変更
            @tip.update_attributes!(parent_id: new_tip.id)
            
            flash[:success] = "Tipを更新しました。"
            redirect_to [@user,new_tip]
        rescue => e
            render 'show'
        end
    end
    
    def show
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
        @user_detail = @user.user_detail
        if !@tip.refer_id.nil?
            @refered_tip = Tip.find(@tip.refer_id)
            @refered_user = User.find(@refered_tip.user_id)
        end
    end
    
    def edit
        @tip = Tip.find(params[:id])
        @reason = @tip.reasons
        @user = User.find(@tip.user_id)
        @user_detail = @user.user_detail
        @shelf = @user.shelves
    end
    
    def refer
        @user = current_user
        @refered_tip = Tip.find(params[:tip_id])
        @refered_user = User.find(@refered_tip.user_id)
        @user_detail = @user.user_detail
        @tip = @user.tips.new(content: @refered_tip.content)
        @refered_tip.reasons.each do |reason|
            @reason = @tip.reasons.new(content: reason.content)
        end
        @shelf = @user.shelves
    end
    
    def auto_load
        @user = User.find(params[:user_id])
        @tips = Tip.where(user_id: params[:user_id]).where(delete_flg: false).limit(20).offset(params[:num])
        respond_to do |format|
            format.js
        end
    end
    
    private
        def tip_params
            params.require(:tip).permit(:content, :shelf_id, :refer_id,:detail,reasons_attributes:[:id,:content,:_destroy])
        end
        
        def tip_params_update
            params.require(:tip).permit(:content, :shelf_id, :refer_id, :parent_id,:detail,reasons_attributes:[:content,:_destroy])
        end
end
