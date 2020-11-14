require 'test_helper'

class Members::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get members_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get members_comments_create_url
    assert_response :success
  end

end
