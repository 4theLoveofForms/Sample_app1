require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @user2 = users(:archer)
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not loggesin" do
    get users_path 
    assert_redirected_to login_url
  end 
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url 
  end 
  
  test "should redirect update when not logged in" do
    patch user_path(@user), params: {user: { name: @user.name, 
                                            email: @user.email} }
    assert_not flash.empty?
    assert_redirected_to login_url 
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user)
    get edit_user_path(@user2)
    assert flash.empty?
    assert_redirected_to root_url
 end
 
 test "should redirect update when logged in as wrong user" do
    log_in_as(@user)
    patch user_path(@user2), params: { user: { name: @user2.name,
                                              email: @user2.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should not allow the admin attribute to be edited viw the web" do
    log_in_as(@user2)
    assert_not @user2.admin?
    patch user_path(@user2), params:  {user: { name: @user2.name, 
                                      email: @user2.email, 
                                      admin: true} }
    assert_not @user2.reload.admin?
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@user2)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
  

end
