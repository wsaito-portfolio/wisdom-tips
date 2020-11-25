require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
 
    def setup 
        @user = users(:michael)
        @other = users(:archer)
        @non_active = users(:NotActivated)
    end
    
    
    test "should redirect to root url iflo show non activated user" do
        log_in_as(@user)
        get user_path(@non_active)
        assert_redirected_to root_url
    end
    
    test "should show users tips" do
        log_in_as(@user)
        get user_path(@user)
        assert_template 'users/show'
        assert_template 'users/_user_profile'
        assert_select 'ol.tips > li',count: 1
        assert_select 'ol.reason_content > li',count: 1
        assert_select 'ol#shelf > li',count: 3
    end
    
    test "should show other users tips" do
        log_in_as(@user)
        get user_path(@other)
        assert_template 'users/show'
        assert_template 'users/_user_profile'
        assert_select 'ol.tips > li',count: 1
        assert_select 'ol.reason_content > li',count: 1
        assert_select 'ol#shelf > li',count: 2
    end
end
