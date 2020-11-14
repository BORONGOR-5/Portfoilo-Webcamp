require 'test_helper'

class Members::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get members_messages_create_url
    assert_response :success
  end

end
