require 'test_helper'

class LikeButtonTest < ActionDispatch::IntegrationTest
    def setup 
        @user1 = users(:michael)
        @user2 = users(:archer)
        
    end
  
    test "click like-button to a tip" do
        log_in_as(@user1)
        get user_path(@user2)
        like_tip = @user2.tips.last
        
        #user1がuser2の1番目のtipに対して「いいね」をすると、ユーザーとtipのいいねが増える。
        assert_difference ['Like.where(user_id: @user1.id).count','Like.where(tip_id: like_tip.id).count'], 1 do
            post likes_path, params:{user_id: @user1.id ,tip_id: like_tip.id} , xhr: true
        end
        
        like = @user1.likes.find_by(user_id: @user1, tip_id: like_tip.id)
        
        #user1がuser2の1番目のtipに対して「いいね」をキャンセルすると、ユーザーとtipのいいねが減る。
        assert_difference ['Like.where(user_id: @user1.id).count','Like.where(tip_id: like_tip.id).count'], -1 do
            delete like_path(like) , params:{user_id: @user1.id} ,xhr: true
        end
    end
    
end
