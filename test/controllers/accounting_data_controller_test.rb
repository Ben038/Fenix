require 'test_helper'

class AccountingDataControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get accounting_data_create_url
    assert_response :success
  end

  test "should get new" do
    get accounting_data_new_url
    assert_response :success
  end

  test "should get index" do
    get accounting_data_index_url
    assert_response :success
  end

  test "should get destroy" do
    get accounting_data_destroy_url
    assert_response :success
  end

  test "should get show" do
    get accounting_data_show_url
    assert_response :success
  end

  test "should get edit" do
    get accounting_data_edit_url
    assert_response :success
  end

  test "should get update" do
    get accounting_data_update_url
    assert_response :success
  end

end
