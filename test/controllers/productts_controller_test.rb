require "test_helper"

class ProducttsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productts_index_url
    assert_response :success
  end

  test "should get new" do
    get productts_new_url
    assert_response :success
  end

  test "should get create" do
    get productts_create_url
    assert_response :success
  end

  test "should get edit" do
    get productts_edit_url
    assert_response :success
  end

  test "should get update" do
    get productts_update_url
    assert_response :success
  end

  test "should get show" do
    get productts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get productts_destroy_url
    assert_response :success
  end
end
