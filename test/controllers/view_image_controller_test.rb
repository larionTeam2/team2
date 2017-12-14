require 'test_helper'

class ViewImageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get view_image_index_url
    assert_response :success
  end

end
