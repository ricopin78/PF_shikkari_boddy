require 'test_helper'

class OkeysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get okeys_create_url
    assert_response :success
  end

  test "should get destroy" do
    get okeys_destroy_url
    assert_response :success
  end
end
