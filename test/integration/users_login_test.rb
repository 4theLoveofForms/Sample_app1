require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "log in message not working corectly" do
    get login_path
    assert_template 'sessions/new' 
    assert_select 'form'
    post "/login", params: {session: {email:"invalid", password: "nottheone"}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty? 
  end
  
end
