require "test_helper"

class BusquedaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get busqueda_index_url
    assert_response :success
  end
end
