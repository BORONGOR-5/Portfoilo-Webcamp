require 'test_helper'

class Members::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_bookmarks_index_url
    assert_response :success
  end

  test "should get create" do
    get members_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get members_bookmarks_destroy_url
    assert_response :success
  end

end
