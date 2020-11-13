require 'test_helper'

class Members::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get member_index" do
    get members_reviews_member_index_url
    assert_response :success
  end

  test "should get show" do
    get members_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get members_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get members_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get members_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get members_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get members_reviews_destroy_url
    assert_response :success
  end

end
