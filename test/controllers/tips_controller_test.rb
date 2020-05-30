require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
 
  def setup
    @tip = tips(:tdd)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Tip.count' do
      post tips_path, params:{ tip: {content:"hogehoge"}}
    end
  assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Tip.count' do
      delete tip_path(@tip)
    end
    assert_redirected_to login_url
  end
end
