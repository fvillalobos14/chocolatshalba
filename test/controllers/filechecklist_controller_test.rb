require 'test_helper'

class FilechecklistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get filechecklist_new_url
    assert_response :success
  end

end
