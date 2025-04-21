require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    Note.create!(
      title: "First Note",
      content: "Hello World",
      user: user
    )

    get "/notes.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Note.count, data.length
  end
end
