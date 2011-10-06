require 'test_helper'

class RegularsubscriptionsControllerTest < ActionController::TestCase
  setup do
    @regularsubscription = regularsubscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regularsubscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regularsubscription" do
    assert_difference('Regularsubscription.count') do
      post :create, regularsubscription: @regularsubscription.attributes
    end

    assert_redirected_to regularsubscription_path(assigns(:regularsubscription))
  end

  test "should show regularsubscription" do
    get :show, id: @regularsubscription.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regularsubscription.to_param
    assert_response :success
  end

  test "should update regularsubscription" do
    put :update, id: @regularsubscription.to_param, regularsubscription: @regularsubscription.attributes
    assert_redirected_to regularsubscription_path(assigns(:regularsubscription))
  end

  test "should destroy regularsubscription" do
    assert_difference('Regularsubscription.count', -1) do
      delete :destroy, id: @regularsubscription.to_param
    end

    assert_redirected_to regularsubscriptions_path
  end
end
