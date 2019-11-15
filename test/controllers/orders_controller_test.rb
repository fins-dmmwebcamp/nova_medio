require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get confirm_payment" do
    get orders_confirm_payment_url
    assert_response :success
  end

  test "should get confirm_order" do
    get orders_confirm_order_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

end
