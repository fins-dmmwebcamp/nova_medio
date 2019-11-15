require 'test_helper'

class Admin::ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_arrivals_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_arrivals_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_arrivals_create_url
    assert_response :success
  end

end
