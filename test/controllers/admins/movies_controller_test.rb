require 'test_helper'

class Admins::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_movies_top_url
    assert_response :success
  end

  test "should get index" do
    get admins_movies_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_movies_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_movies_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_movies_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_movies_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_movies_update_url
    assert_response :success
  end

end
