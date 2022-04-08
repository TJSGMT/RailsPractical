require "test_helper"

class Products1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products1_index_url
    assert_response :success
  end

  test "should get new" do
    get products1_new_url
    assert_response :success
  end

  test "should get create" do
    get products1_create_url
    assert_response :success
  end

  test "should get show" do
    get products1_show_url
    assert_response :success
  end

  test "should get edit" do
    get products1_edit_url
    assert_response :success
  end

  test "should get update" do
    get products1_update_url
    assert_response :success
  end

  test "should get destroy" do
    get products1_destroy_url
    assert_response :success
  end
end
