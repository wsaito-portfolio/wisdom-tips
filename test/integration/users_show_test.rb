require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
 
 def setup 
    @active = users(:michael)
    @non_active = users(:NotActivated)
 end
 
 
 test "should redirect to root url if show non activated user" do
   log_in_as(@active)
   get user_path(@non_active)
   assert_redirected_to root_url
 end
end
