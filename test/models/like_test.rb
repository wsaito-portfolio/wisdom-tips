require 'test_helper'

class LikeTest < ActiveSupport::TestCase
    def setup
        @like = Like.new(user_id: users(:michael).id, tip_id: tips(:tdd).id)
    end
    
    test "should be valid" do
        assert @like.valid?
    end
    
    test "should require a user_id" do
        @like.user_id = nil
        assert_not @like.valid?
    end
    
    test "should require a tip_id" do
        @like.tip_id = nil
        assert_not @like.valid?
    end
end
