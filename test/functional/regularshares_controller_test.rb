require 'test_helper'

class RegularsharesControllerTest < ActionController::TestCase
  setup do
    @regularshare = regularshares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regularshares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regularshare" do
    assert_difference('Regularshare.count') do
      post :create, regularshare: @regularshare.attributes
    end

    assert_redirected_to regularshare_path(assigns(:regularshare))
  end

  test "should show regularshare" do
    get :show, id: @regularshare.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regularshare.to_param
    assert_response :success
  end

  test "should update regularshare" do
    put :update, id: @regularshare.to_param, regularshare: @regularshare.attributes
    assert_redirected_to regularshare_path(assigns(:regularshare))
  end

  test "should destroy regularshare" do
    assert_difference('Regularshare.count', -1) do
      delete :destroy, id: @regularshare.to_param
    end

    assert_redirected_to regularshares_path
  end
end
