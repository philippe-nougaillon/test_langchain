require "test_helper"

class ClientControllerTest < ActionDispatch::IntegrationTest
  test "should get ask" do
    get client_ask_url
    assert_response :success
  end
end
