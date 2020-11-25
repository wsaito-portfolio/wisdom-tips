require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
 
    def setup
        @tip = tips(:tdd)
        @refer_tip = tips(:archers_tip)
        @user = @tip.user
        @reason = reasons(:tdd_reason)
        @other_user = users(:archer)
        @shelf = shelves(:shelf_1)
    end

    #new  
    test "should redirect new when not logged in" do
        get new_user_tip_path(@user)
        assert_redirected_to login_url
    end
    
    test "should not get new when wrong user" do
        log_in_as(@other_user)
        get new_user_tip_path(@user)
        assert_redirected_to root_url
    end
    
    test "should get new when correct user" do
        log_in_as(@user)
        get new_user_tip_path(@user)
        assert_response :success
    end

    #create
    test "should redirect create when not logged in" do
        assert_no_difference 'Tip.count' do
            post user_tips_path(@user,@tip), params:{ user_id: @user.id, tip: {content:"hogehoge", reason: {content:"gehogeho"}}}
        end
        assert_redirected_to login_url
    end
    
    test "should not create when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Tip.count' do
            post user_tips_path(@user,@tip), params:{ user_id: @user.id, tip: {content:"hogehoge", reason: {content:"gehogeho"}}}
        end
        assert_redirected_to root_url
    end

    #destroy
    test "should redirect destroy when not logged in" do
        assert_no_difference 'Tip.count' do
            delete user_tip_path(@user,@tip)
        end
        assert_redirected_to login_url
    end
    
    test "should not destroy when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Tip.count' do
            delete user_tip_path(@user,@tip)
        end
        assert_redirected_to root_url
    end
    
    #edit
    test "should redirect edit when not logged in" do
        get edit_user_tip_path(@user,@tip)
        assert_redirected_to login_url
    end
    
    test "should not get edit when wrong user" do
        log_in_as(@other_user)
        get edit_user_tip_path(@user,@tip)
        assert_redirected_to root_url
    end
    
    test "should get edit when correct user" do
        log_in_as(@user)
        get edit_user_tip_path(@user,@tip)
        assert_response :success
    end
    
    #update
    test "should redirect update when not logged in" do
        t_content = "hogehoge"
        r_content = "gehogeho"
        shelf_id = "1"
        patch user_tip_path(@user,@tip), params:{   user_id: @user.id,
                                                    tip:{content: t_content, reason: {content: r_content}},
                                                    shelf_id: shelf_id
        }
        assert_not_equal @tip.content, t_content
        assert_not_equal @tip.shelf_id, shelf_id
        assert_not_equal @reason.content, r_content
        assert_redirected_to login_url
    end
    
    test "should not update when wrong user" do
        log_in_as(@other_user)
        t_content = "hogehoge"
        r_content = "gehogeho"
         shelf_id = "1"
        patch user_tip_path(@user,@tip), params:{   user_id: @user.id,
                                                    tip:{content: t_content, reason: {content: r_content}},
                                                    shelf_id: shelf_id
        }
        assert_not_equal @tip.content, t_content
        assert_not_equal @tip.shelf_id, shelf_id
        assert_not_equal @reason.content, r_content
        assert_redirected_to root_url
    end

    #show
    test "should get show" do
        #log_in_as(@user)
        get user_tip_path(@user,@tip)
        assert_response :success
    end
    
    #refer
    test "should redirect refer when not logged in" do
        get user_tip_refer_path(@user,@refer_tip)
        assert_redirected_to login_url
    end
    
    test "should get refer when correct user" do
        log_in_as(@user)
        get user_tip_refer_path(@user,@refer_tip)
        assert_response :success
    end
    
end
