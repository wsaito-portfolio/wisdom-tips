require 'test_helper'

class UserDetailTest < ActiveSupport::TestCase
    def setup
        @user = users(:michael)
        @user_detail = @user.build_user_detail(profile_description: "詳細",id: 100)
    end 
    
    test "should be valid" do
        assert @user_detail.valid?
    end
    
    test "should not be too long" do
        @user_detail.profile_description = "a"*201
        assert_not @user_detail.valid?
    end
end
