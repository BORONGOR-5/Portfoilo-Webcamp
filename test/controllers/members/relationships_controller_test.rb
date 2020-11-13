require 'test_helper'

class Members::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_relationships_index_url
    assert_response :success
  end

  test "should get show" do
    get members_relationships_show_url
    assert_response :success
  end

  test "should get create" do
    get members_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get members_relationships_destroy_url
    assert_response :success
  end

end
