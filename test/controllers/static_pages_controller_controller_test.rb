require 'test_helper'

class StaticPagesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_pages_controller_index_url
    assert_response :success
  end

end
