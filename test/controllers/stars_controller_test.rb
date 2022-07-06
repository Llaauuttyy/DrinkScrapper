require "test_helper"

class StarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stars_index_url
    assert_response :success
  end
end
