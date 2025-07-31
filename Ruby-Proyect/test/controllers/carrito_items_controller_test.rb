require "test_helper"

class CarritoItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carrito_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get carrito_items_destroy_url
    assert_response :success
  end
end
