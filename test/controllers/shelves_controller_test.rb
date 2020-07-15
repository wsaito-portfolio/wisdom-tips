require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:michael)
        @other_user = users(:archer)
        @user_detail = @user.user_detail
        @shelf = shelves(:shelf_1)
    end
    
    #new
    test "should redirect new when not logged in" do
        get new_user_shelf_path(@user)
        assert_redirected_to login_url
    end
    
    test "should not get new when wrong user" do
        log_in_as(@other_user)
        get new_user_shelf_path(@user)
        assert_redirected_to root_url
    end
    
    test "should get new when correct user" do
        log_in_as(@user)
        get new_user_shelf_path(@user)
        assert_response :success
    end
    
    #create
    test "should redirect create when not logged in" do
        name = "new_shelf"
        assert_no_difference 'Shelf.count' do
            post user_shelves_path(@user), params: {name: name}
        end
    end
    
    test "should not create when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Shelf.count' do
            post user_shelves_path(@user), params: {name: name}
        end
        assert_redirected_to root_url
    end
    
    #edit
    test "should redirect edit when not logged in" do
        get edit_user_shelf_path(@user,@shelf)
        assert_redirected_to login_url
    end
    
    test "should not get edit when wrong user" do
        log_in_as(@other_user)
        get edit_user_shelf_path(@user,@shelf)
        assert_redirected_to root_url
    end
    
    test "should get edit when correct user" do
        log_in_as(@user)
        get edit_user_shelf_path(@user,@shelf)
        assert_response :success
    end
    
    #update
    test "should redirect update when not logged in" do
        new_name = "new_shelf"
        patch user_shelf_path(@user,@shelf), params:{   user_id: @user.id,
                                                        shelf: {name: new_name
                                                        }
        }
        assert_not_equal @shelf.name, new_name
        assert_redirected_to login_url
    end
    
    test "should not update when wrong user" do
        log_in_as(@other_user)
        new_name = "new_shelf"
        patch user_shelf_path(@user,@shelf) , params:{   user_id: @user.id,
                                                        shelf: {name: new_name
                                                        }
        }
        assert_not_equal @shelf.name, new_name
        assert_redirected_to root_url
    end
    
    #show
    test "should get show" do
        #log_in_as(@user)
        get user_shelf_path(@user,@shelf)
        assert_response :success
    end
    
    #destroy
    test "should redirect destroy when not logged in" do
        assert_no_difference 'Shelf.count' do
            delete user_shelf_path(@user,@shelf)
        end
        assert_redirected_to login_url
    end
    
    test "should not destroy when wrong user" do
        log_in_as(@other_user)
        assert_no_difference 'Shelf.count' do
            delete user_tip_path(@user,@shelf)
        end
        assert_redirected_to root_url
    end
    
end
