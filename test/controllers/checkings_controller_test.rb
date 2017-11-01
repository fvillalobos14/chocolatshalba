require 'test_helper'

class CheckingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkings_index_url
    assert_response :success
  end

  test "should get show" do
    get checkings_show_url
    assert_response :success
  end

end
