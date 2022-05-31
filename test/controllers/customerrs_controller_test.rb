require "test_helper"

class CustomerrsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customerrs_index_url
    assert_response :success
  end

  test "should get create" do
    get customerrs_create_url
    assert_response :success
  end

  test "should get edit" do
    get customerrs_edit_url
    assert_response :success
  end
end
