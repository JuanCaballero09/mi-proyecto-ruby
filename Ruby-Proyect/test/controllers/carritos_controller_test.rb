require "test_helper"

class CarritosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carritos_show_url
    assert_response :success
  end
end
