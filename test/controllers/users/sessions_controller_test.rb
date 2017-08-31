require 'test_helper'

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_sessions_new_url
    assert_response :success
  end

end
