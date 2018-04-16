require 'test_helper'

class JetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jets_index_url
    assert_response :success
  end

  test "should get new" do
    get jets_new_url
    assert_response :success
  end

  test "should get show" do
    get jets_show_url
    assert_response :success
  end

end
