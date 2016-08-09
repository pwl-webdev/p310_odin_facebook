require 'test_helper'

class UserFriendshipTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end

  #test "should send friend request" do
  #		post friendships_path, params: { friend_id: @other.id}
  #		assert_equal  1, @user.friendships.count
  #end
end
