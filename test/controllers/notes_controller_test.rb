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

  test "show" do
    user = User.create!(
      name: "Show Tester",
      email: "show@example.com",
      password: "password",
      password_confirmation: "password"
    )
    note = Note.create!(
      title: "Detail Note",
      content: "Deep dive",
      user: user
    )
    get "/notes/#{note.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    expected_keys = %w[id title content user_id created_at updated_at]
    assert_equal expected_keys.sort, data.keys.sort
  end

  test "create" do
    user = User.create!(
      name: "Creator",
      email: "create@example.com",
      password: "password",
      password_confirmation: "password"
    )
assert_difference "Note.count", 1 do
  post "/notes.json", params: {
    title: "New Note",
    content: "Content goes here",
    user_id: user.id
      }
    end

  assert_response :success
  end

  test "update" do
    user = User.create!(
      name: "Updater",
      email: "update@example.com",
      password: "password",
      password_confirmation: "password"
    )
    note = Note.create!(
      title: "Old Title",
      content: "Stale content",
      user: user
    )

    patch "/notes/#{note.id}.json", params: { title: "New Title" }
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal "New Title", data["title"]
  end
end
