require 'test_helper'

class ShelfDestroyTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:michael)
        @other = users(:archer)
        @shelf = @user.shelves.find_by(name: "shelf_1")
        @tips = @user.tips.where(shelf_id: @shelf.id)
    end
    
    test "un successful destroy shelf by other user" do
        log_in_as(@other)
        get edit_user_shelf_path(@user,@shelf)
        assert_no_difference 'Shelf.count' do
            delete user_shelf_path(@user,@shelf) 
        end
        assert_redirected_to root_path
    end
    
    test "successful destroy shelf" do
        log_in_as(@user)
        get edit_user_shelf_path(@user,@shelf)
        assert_difference 'Shelf.count', -1 do
            assert_difference '@tips.count', - @tips.count do
                delete user_shelf_path(@user,@shelf) 
            end
        end
        
        assert_not flash.empty?
        assert_redirected_to @user
        get user_path(@user)
    end
    
end
