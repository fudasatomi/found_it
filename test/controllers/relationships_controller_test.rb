require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get relationships_follow_url
    assert_response :success
  end

end
