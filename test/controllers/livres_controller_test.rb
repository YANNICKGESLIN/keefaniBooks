require "test_helper"

class LivresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get livres_show_url
    assert_response :success
  end
end
