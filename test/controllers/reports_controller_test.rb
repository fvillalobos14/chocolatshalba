require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get organization" do
    get reports_organization_url
    assert_response :success
  end

end
