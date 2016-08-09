require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:lana)
  end

  test "associated posts should be destroyed" do
    @user.posts.create!(content: "Lorem ipsum")
    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end

end
