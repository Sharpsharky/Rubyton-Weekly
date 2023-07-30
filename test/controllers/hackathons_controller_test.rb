require "test_helper"

class HackathonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hackathons_index_url
    assert_response :success
  end

  test "should get create" do
    get hackathons_create_url
    assert_response :success
  end
end
