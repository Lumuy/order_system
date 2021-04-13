require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should redirect if not logged in" do
    get orders_url
    assert_redirected_to log_in_path
  end

  test "should login success" do
    post sessions_path, params: {email: @user.email, password: @user.password}
    assert_redirected_to orders_path
  end
end

