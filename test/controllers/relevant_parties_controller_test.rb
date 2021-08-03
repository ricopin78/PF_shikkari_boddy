require 'test_helper'

class RelevantPartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relevant_parties_create_url
    assert_response :success
  end

  test "should get update" do
    get relevant_parties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get relevant_parties_destroy_url
    assert_response :success
  end

end
