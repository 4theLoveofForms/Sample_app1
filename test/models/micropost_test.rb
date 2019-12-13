require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lopis lorium")
  end
  test "should be valid" do
    assert @micropost.valid?
  end
  
  test "micropost should have a user id"  do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  # test "for the example the content length should be less that 140 characters" do
    # @micropost.content = "a" * 141
    # assert_not @micropost.valid?
  # end
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
  
    
end
