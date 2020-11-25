require 'test_helper'

class TipShowTest < ActionDispatch::IntegrationTest
    def setup 
        @user = users(:michael)
        @other = users(:archer)
        @refer_user = users(:victoria)
        @tip = tips(:tdd)
        @other_tip = tips(:archers_tip)
        @refer_tip = tips(:refer_tip)
        @refered_tip = tips(:refered_tip)
        @non_active = users(:NotActivated)
    end
    
    test "should show tip's detail" do
        log_in_as(@user)
        get user_tip_path(@user,@tip)
        assert_template 'tips/show'
        assert_template 'users/_user_profile'
    end
    
    test "should show other tip's detail" do
        log_in_as(@user)
        get user_tip_path(@other,@other_tip)
        assert_template 'tips/show'
        assert_template 'users/_user_profile'
    end
    
    test "should show refered tip's detail" do
        log_in_as(@user)
        get user_tip_path(@refer_user, @refer_tip)
        assert_template 'tips/show'
        assert_template 'users/_user_profile'
        assert_select 'div.refer',1
        assert_select '.tip_content',@refered_tip.content,1
        assert_select '.reason_content',@refered_tip.reasons[0].content,1
    end
end
