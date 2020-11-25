require 'test_helper'

class ShelfEditTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:michael)
        @other = users(:archer)
        @shelf = @user.shelves.find_by(name: "shelf_1")
    end
    
    test "un successful edit by invalid parameter" do
        log_in_as(@user)
        get edit_user_shelf_path(@user,@shelf)
        name = ""
        assert_no_difference 'Shelf.count' do
            patch user_shelf_path(@user,@shelf) , params: { shelf:{name: name}   }
        end
        assert_template 'shelves/edit'
        assert_select 'div#error_explanation'
    end
    
    test "un successful edit by other user " do
        log_in_as(@other)
        get edit_user_shelf_path(@user,@shelf)
        name = "renamed_shelf"
        assert_no_difference 'Shelf.count' do
            patch user_shelf_path(@user,@shelf) , params: { shelf:{name: name}   }
        end
        assert_redirected_to root_path
    end

    test "successful edit" do
        log_in_as(@user)
        get edit_user_shelf_path(@user,@shelf)
        name = "renamed_shelf"
        assert_no_difference 'Shelf.count' do
            patch user_shelf_path(@user,@shelf) , params: { shelf:{name: name}   }
        end
        
        assert_not flash.empty?
        assert_redirected_to @user
        renamed_shelf = @user.shelves.find_by(name: name)
        assert_equal name, renamed_shelf.name
        get user_shelf_path(@user,renamed_shelf)
    end
end
