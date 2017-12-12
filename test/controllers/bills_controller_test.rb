require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bills_index_url
    assert_response :success
  end

  test "should get show" do
    get bills_show_url
    assert_response :success
  end

  test "should get new" do
    get bills_new_url
    assert_response :success
  end

  test "should get create" do
    get bills_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bills_destroy_url
    assert_response :success
  end

  test "should get bill_params" do
    get bills_bill_params_url
    assert_response :success
  end

end
