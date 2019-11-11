require 'test_helper'

class InternationalClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get international_clients_create_url
    assert_response :success
  end

  test "should get new" do
    get international_clients_new_url
    assert_response :success
  end

  test "should get index" do
    get international_clients_index_url
    assert_response :success
  end

  test "should get destroy" do
    get international_clients_destroy_url
    assert_response :success
  end

  test "should get show" do
    get international_clients_show_url
    assert_response :success
  end

  test "should get edit" do
    get international_clients_edit_url
    assert_response :success
  end

  test "should get update" do
    get international_clients_update_url
    assert_response :success
  end

end
