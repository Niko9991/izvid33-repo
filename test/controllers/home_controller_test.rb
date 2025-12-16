require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get razlaga" do
    # Log in the user by posting to your login path
    post home_razlaga_path, params: { email: @user.email, password: "password" }
    # now session[:user_id] is set

    get home_razlaga_url
    assert_response :success
  end
end
