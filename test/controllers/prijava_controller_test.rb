require 'test_helper'

class PrijavaControllerTest < ActionController::TestCase
  test "should get prijavime" do
    get :prijavime
    assert_response :success
  end

  test "should get odjava" do
    get :odjava
    assert_response :success
  end

end
