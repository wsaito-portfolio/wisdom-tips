require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
    #index
    test "should get show users" do
        @user = users(:victoria)
        log_in_as(@user)
        get search_path(search: "victoria")
        assert_select "ol.users" ,1
        assert_response :success
    end
    
    test "should get show tips " do
        @user = users(:victoria)
        log_in_as(@user)
        get search_path, params:{search: "TDD"}
        assert_select "ol.tips" ,1
        assert_response :success
    end
end
