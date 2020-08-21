require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  
    def setup
        @tip = tips(:tdd)
        @user = users(:archer)
        @other_user = users(:lana)
        @like = likes(:like)
    end
  
    test "like create should require logged-in user" do
        assert_no_difference 'Like.count' do
            post likes_path params: {user_id: @user.id,tip_id: @tip.id }
        end
        assert_redirected_to login_url
    end
    
    test "should not create like when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Like.count' do
            post likes_path params: {user_id: @user.id,tip_id: @tip.id }
        end
        assert_redirected_to root_url
    end

    test "like destroy should require logged-in user" do
        assert_no_difference 'Like.count' do
            delete like_path(@like)
        end
        assert_redirected_to login_url
    end
    
    test "should not destroy like when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Like.count' do
            delete like_path(@like), params: {user_id: @like.user_id}
        end
        assert_redirected_to root_url
    end
end
