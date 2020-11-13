require 'test_helper'

class Members::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get members_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get members_favorites_destroy_url
    assert_response :success
  end

end
