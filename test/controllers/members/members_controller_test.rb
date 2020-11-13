require 'test_helper'

class Members::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_members_index_url
    assert_response :success
  end

  test "should get show" do
    get members_members_show_url
    assert_response :success
  end

  test "should get edit" do
    get members_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get members_members_update_url
    assert_response :success
  end

  test "should get destroy_page" do
    get members_members_destroy_page_url
    assert_response :success
  end

  test "should get leave" do
    get members_members_leave_url
    assert_response :success
  end

end
