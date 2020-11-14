require 'test_helper'

class Members::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get members_movies_top_url
    assert_response :success
  end

  test "should get index" do
    get members_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get members_movies_show_url
    assert_response :success
  end

end
