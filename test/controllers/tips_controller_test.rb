require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
 
  def setup
    @tip = tips(:tdd)
    @user = @tip.user
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Tip.count' do
      post user_tips_path(@user,@tip), params:{ user_id: @user.id, tip: {content:"hogehoge", reason: {content:"gehogeho"}}}
    end
  assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Tip.count' do
      delete user_tip_path(@user,@tip)
    end
    assert_redirected_to login_url
  end
end
