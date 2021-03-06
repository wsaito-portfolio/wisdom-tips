require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
 
    def setup
        @admin = users(:michael)
        @non_admin = users(:archer)
    end
 
    test "index as admin including pagination and delete links and display activated users" do
        log_in_as(@admin)
        get users_path
        assert_template 'users/index'
        page_of_users = @users = User.where(activated: true).limit(20)
        page_of_users.each do |user|
            if user.activated?
                assert_select 'a[href=?]',user_path(user),text:user.name
                unless user == @admin
                    assert_select 'a[href=?]',user_path(user),text:'delete'
                end
            end
        end

        assert_difference 'User.count',-1 do
            delete user_path(@non_admin)
        end
    end
 
    test "index as non-admin" do
        log_in_as(@non_admin)
        get users_path
        assert_select 'a',text:'delete',count:0
    end
 
end
