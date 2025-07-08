require "test_helper"

class Grupos::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupos_product = grupos_products(:one)
  end

  test "should get index" do
    get grupos_products_url
    assert_response :success
  end

  test "should get new" do
    get new_grupos_product_url
    assert_response :success
  end

  test "should create grupos_product" do
    assert_difference("Grupos::Product.count") do
      post grupos_products_url, params: { grupos_product: {} }
    end

    assert_redirected_to grupos_product_url(Grupos::Product.last)
  end

  test "should show grupos_product" do
    get grupos_product_url(@grupos_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupos_product_url(@grupos_product)
    assert_response :success
  end

  test "should update grupos_product" do
    patch grupos_product_url(@grupos_product), params: { grupos_product: {} }
    assert_redirected_to grupos_product_url(@grupos_product)
  end

  test "should destroy grupos_product" do
    assert_difference("Grupos::Product.count", -1) do
      delete grupos_product_url(@grupos_product)
    end

    assert_redirected_to grupos_products_url
  end
end
