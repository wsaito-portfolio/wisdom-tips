require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
    #index
    test "should get show " do
        #log_in_as(@user)
        get search_path
        assert_response :success
    end
end
