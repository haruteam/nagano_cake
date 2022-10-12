require "test_helper"

class Admin::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cart_items_index_url
    assert_response :success
  end
end
