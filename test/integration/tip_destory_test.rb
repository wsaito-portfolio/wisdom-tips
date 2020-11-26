require 'test_helper'

class TipDestoryTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:michael)
        @other = users(:archer)
        @tip = tips(:tdd)
       
    end
    
    test "un successful destroy tip by other user" do
        log_in_as(@other)
        assert_no_difference 'Tip.where(delete_flg: false).count' do
            assert_no_difference 'Tip.where(delete_flg: true).count' do
                delete user_tip_path(@user,@tip) 
            end
        end
        
        assert_redirected_to root_path
    end
    
    test "successful destroy tip " do
        log_in_as(@user)
        
        assert_difference 'Tip.where(delete_flg: false).count', -1 do
            assert_difference 'Tip.where(delete_flg: true).count', 1 do
                delete user_tip_path(@user,@tip) 
            end
        end
        assert_not flash.empty?
        assert_redirected_to @user
        active_tips_count = @user.tips.where(delete_flg: false).count
        get user_path(@user)
        assert_select "ol.tips > li", active_tips_count
    end
end
