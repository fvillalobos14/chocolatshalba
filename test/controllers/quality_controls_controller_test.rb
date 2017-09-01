require 'test_helper'

class QualityControlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quality_controls_index_url
    assert_response :success
  end

end
