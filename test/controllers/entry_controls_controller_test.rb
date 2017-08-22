require 'test_helper'

class EntryControlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get entry_controls_new_url
    assert_response :success
  end

  test "should get show" do
    get entry_controls_show_url
    assert_response :success
  end

end
