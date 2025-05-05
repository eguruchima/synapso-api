require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  # helper to log in via the sessions endpoint
  def sign_in_as(user)
    post "/sessions.json", params: {
      email:    user.email,
      password: user.password
    }
    assert_response :created
  end

  test "index" do
    user = User.create!(
      name:                  "Test User",
      email:                 "test@example.com",
      password:              "password",
      password_confirmation: "password"
    )
    Note.create!(
      title:   "First Note",
      content: "Hello World",
      user:    user
    )

    get "/notes.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal Note.count, data.length
  end

  test "show" do
    user = User.create!(
      name:                  "Show Tester",
      email:                 "show@example.com",
      password:              "password",
      password_confirmation: "password"
    )
    note = Note.create!(
      title:   "Detail Note",
      content: "Deep dive",
      user:    user
    )

    get "/notes/#{note.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    expected_keys = %w[id title content user_id created_at updated_at]
    assert_equal expected_keys.sort, data.keys.sort
  end

  test "create" do
    user = User.create!(
      name:                  "Creator",
      email:                 "create@example.com",
      password:              "password",
      password_confirmation: "password"
    )

    sign_in_as(user)

    assert_difference "Note.count", 1 do
      post "/notes.json", params: {
        title:   "New Note",
        content: "Content goes here"
      }
    end
    assert_response :success
  end

  test "update" do
    user = User.create!(
      name:                  "Updater",
      email:                 "update@example.com",
      password:              "password",
      password_confirmation: "password"
    )
    note = Note.create!(
      title:   "Old Title",
      content: "Stale content",
      user:    user
    )

    sign_in_as(user)

    patch "/notes/#{note.id}.json", params: {
      title: "New Title"
    }
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "New Title", data["title"]
  end

  test "destroy" do
    user = User.create!(
      name:                  "Destroyer",
      email:                 "destroy@example.com",
      password:              "password",
      password_confirmation: "password"
    )
    note = Note.create!(
      title:   "To Be Deleted",
      content: "This will go away",
      user:    user
    )

    sign_in_as(user)

    assert_difference "Note.count", -1 do
      delete "/notes/#{note.id}.json"
    end
    assert_response :no_content
  end
end
