require 'test_helper'

class EventTodosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_todos_create_url
    assert_response :success
  end

  test "should get update" do
    get event_todos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_todos_destroy_url
    assert_response :success
  end
end
