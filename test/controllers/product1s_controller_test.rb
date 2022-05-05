require "test_helper"

class Product1sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product1s_index_url
    assert_response :success
  end

  test "should get new" do
    get product1s_new_url
    assert_response :success
  end

  test "should get create" do
    get product1s_create_url
    assert_response :success
  end

  test "should get show" do
    get product1s_show_url
    assert_response :success
  end

  test "should get edit" do
    get product1s_edit_url
    assert_response :success
  end

  test "should get update" do
    get product1s_update_url
    assert_response :success
  end

  test "should get destroy" do
    get product1s_destroy_url
    assert_response :success
  end
end
