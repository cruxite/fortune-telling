require 'test_helper'

class FortuneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fortune_index_url
    assert_response :success
  end

end
