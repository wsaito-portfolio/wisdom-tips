require 'test_helper'

class ShelfCreateTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:michael)
        @other = users(:archer)
        @shelf = @user.shelves.find_by(name: "shelf_1")
        log_in_as(@user)
    end
    
    test "un successful create by invalid parameters" do
        log_in_as(@user)
        get new_user_shelf_path(@user)
        name = ""
        assert_no_difference 'Shelf.count' do
            post user_shelves_path(@user) , params: { shelf:{name: name}   }
        end
        assert_template 'shelves/new'
        assert_select 'div#error_explanation'
    end
    
    test "un successful create by same name" do
        log_in_as(@user)
        get new_user_shelf_path(@user)
        name = @shelf.name
        assert_no_difference 'Shelf.count' do
            post user_shelves_path(@user) , params: { shelf:{name: name}   }
        end
        assert_template 'shelves/new'
        assert_select 'div#error_explanation'
    end

    test "un successful create by  other user" do
        log_in_as(@other)
        name = "new_shelf"
        assert_no_difference 'Shelf.count' do
            post user_shelves_path(@user) , params: { shelf:{name: name}   }
        end
        assert_redirected_to root_path
    end

    test "successful create a new shelf" do
        log_in_as(@user)
        get new_user_shelf_path(@user)
        name = "new_shelf"
        assert_difference 'Shelf.count',1 do
            post user_shelves_path(@user) , params: { shelf:{name: name}   }
        end
        
        assert_not flash.empty?
        assert_redirected_to @user
        created_shelf = @user.shelves.find_by(name: name)
        assert_equal name, created_shelf.name
        get user_shelf_path(@user,created_shelf)
    end
end
