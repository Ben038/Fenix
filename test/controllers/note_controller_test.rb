require 'test_helper'

class NoteControllerTest < ActionDispatch::IntegrationTest
  test "should get store" do
    get note_store_url
    assert_response :success
  end

  test "should get new" do
    get note_new_url
    assert_response :success
  end

  test "should get create" do
    get note_create_url
    assert_response :success
  end

  test "should get destroy" do
    get note_destroy_url
    assert_response :success
  end

  test "should get update" do
    get note_update_url
    assert_response :success
  end

end
