require "test_helper"

class RetoursControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get retours_show_url
    assert_response :success
  end

  test "should get create" do
    get retours_create_url
    assert_response :success
  end

  test "should get delete" do
    get retours_delete_url
    assert_response :success
  end

  test "should get update" do
    get retours_update_url
    assert_response :success
  end
end
