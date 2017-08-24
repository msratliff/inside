require 'test_helper'

class Venues::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get venues_sessions_new_url
    assert_response :success
  end

end
