require 'test_helper'

class HaloControllerTest < ActionController::TestCase
  test "should get Yay" do
    get :Yay
    assert_response :success
  end

end
