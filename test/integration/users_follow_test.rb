require 'test_helper'

class UsersFollowTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:michael)
        @following = users(:lana)
        @unfollowed = users(:archer)
        log_in_as(@user)
    end

    test "follow test" do
        get user_path(@unfollowed)
        assert_template 'users/_follow'
        assert_difference ['Relationship.where(follower_id: @user.id).count','Relationship.where(followed_id: @unfollowed.id).count'], 1 do
            post relationships_path(@unfollower),params:{followed_id: @unfollowed.id}, xhr: true
        end
    end
    
    test "unfollow test" do
        get user_path(@following)
        assert_template 'users/_unfollow'
        assert_difference ['Relationship.where(follower_id: @user.id).count','Relationship.where(followed_id: @following.id).count'], -1 do
            delete relationship_path(@user.active_relationships.find_by(followed_id: @following.id)),xhr: true
        end
    end
end
