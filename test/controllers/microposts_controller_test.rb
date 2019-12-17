require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @micropost = microposts(:orange)
  end

  test "unlogged in user should't be able to create posts" do
    assert_no_difference 'Micropost.count' do
     post microposts_path, params: { micropost: { content: "Lopis lorum" } }
    end
    assert_redirected_to login_url
  end
  
   test "unlogged in user should't be able to create or destroy posts" do
    assert_no_difference 'Micropost.count' do
     delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end  
    
end
