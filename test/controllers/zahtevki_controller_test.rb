require 'test_helper'

class ZahtevkiControllerTest < ActionController::TestCase
  test "should get dodaj" do
    get :dodaj
    assert_response :success
  end

  test "should get uredi" do
    get :uredi
    assert_response :success
  end

  test "should get izbrisi" do
    get :izbrisi
    assert_response :success
  end

  test "should get potrdi" do
    get :potrdi
    assert_response :success
  end

  test "should get prevzemi" do
    get :prevzemi
    assert_response :success
  end

  test "should get eskaliraj" do
    get :eskaliraj
    assert_response :success
  end

end
