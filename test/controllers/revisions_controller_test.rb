require 'test_helper'

class RevisionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revisions_index_url
    assert_response :success
  end

end
