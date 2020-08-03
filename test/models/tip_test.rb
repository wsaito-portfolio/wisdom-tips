require 'test_helper'

class TipTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @tip = @user.tips.build(content:"tipsの内容",id: "100")
    @tip.reasons.build(content:"reasonの内容")
    
    @tip_no_reason = @user.tips.build(content:"tipsの内容",id: "100")
  end 
  
  test "should be valid" do
    assert @tip.valid?
  end
  
  test "user id should be present" do
    @tip.user_id = nil
    assert_not @tip.valid?
  end
  
  test "content should be present" do
    @tip.content = " "
    assert_not @tip.valid?
  end
  
  test "should have a reason at least" do
    assert_not @tip_no_reason.valid?    
  end
  
  test "content should be at most 100 characters" do
    @tip.content = "a"*101
    assert_not @tip.valid?
  end
end
