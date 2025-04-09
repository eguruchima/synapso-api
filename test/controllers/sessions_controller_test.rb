require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      name: "Test",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  test "create" do
    post "/sessions.json", params: {
      email: @user.email,
      password: "password"
    }

    assert_response :created
    data = JSON.parse(response.body)
    assert_equal [ "email", "user_id" ], data.keys
  end

  test "destroy" do
    delete "/sessions.json"
    assert_response :success
    data = JSON.parse(response.body)
    assert_equal({ "message" => "Logged out sucessfully" }, data)
  end
end
