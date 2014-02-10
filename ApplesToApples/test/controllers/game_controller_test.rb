require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get leave" do
    get :leave
    assert_response :success
  end

end
