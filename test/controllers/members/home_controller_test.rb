require 'test_helper'

class Members::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get members_home_about_url
    assert_response :success
  end

  test "should get producer" do
    get members_home_producer_url
    assert_response :success
  end

end
