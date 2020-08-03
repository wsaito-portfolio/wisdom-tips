require 'test_helper'

class ShelfTest < ActiveSupport::TestCase
    def setup
        @user = users(:michael)
        @shelf = @user.shelves.build(name: "本棚",id: 100)
    end 
    
    test "should be valid" do
        assert @shelf.valid?
    end
    
    test "name should be present" do
        @shelf.name = nil
        assert_not @shelf.valid?
    end
end
