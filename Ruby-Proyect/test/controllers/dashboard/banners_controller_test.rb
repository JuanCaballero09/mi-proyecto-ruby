require "test_helper"

class Dashboard::BannersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_banners_index_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_banners_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_banners_destroy_url
    assert_response :success
  end
end
