require "test_helper"

class MembresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get membres_show_url
    assert_response :success
  end
end
