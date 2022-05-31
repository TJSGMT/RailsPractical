require "test_helper"

class OrderrsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orderrs_index_url
    assert_response :success
  end

  test "should get new" do
    get orderrs_new_url
    assert_response :success
  end

  test "should get create" do
    get orderrs_create_url
    assert_response :success
  end

  test "should get edit" do
    get orderrs_edit_url
    assert_response :success
  end

  test "should get show" do
    get orderrs_show_url
    assert_response :success
  end

  test "should get update" do
    get orderrs_update_url
    assert_response :success
  end

  test "should get delete" do
    get orderrs_delete_url
    assert_response :success
  end
end
