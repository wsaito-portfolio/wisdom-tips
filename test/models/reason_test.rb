require 'test_helper'

class ReasonTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @tip = @user.tips.build(content:"tipsの内容",id: 100)
    @reason = @tip.reasons.build(content:"tipsの理由")
  end 
  
  test "should be valid" do
    assert @reason.valid?
  end
  
  test "content should be present" do
    @reason.content = " "
    assert_not @reason.valid?
  end
  
  test "content should be at most 100 characters" do
    @reason.content = "a"*101
    assert_not @reason.valid?
  end
end
