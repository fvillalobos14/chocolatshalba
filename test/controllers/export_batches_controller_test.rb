require 'test_helper'

class ExportBatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get export_batches_join_url
    assert_response :success
  end

  test "should get new" do
    get export_batches_new_url
    assert_response :success
  end

end
