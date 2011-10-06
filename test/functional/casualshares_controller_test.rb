require 'test_helper'

class CasualsharesControllerTest < ActionController::TestCase
  setup do
    @casualshare = casualshares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casualshares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create casualshare" do
    assert_difference('Casualshare.count') do
      post :create, casualshare: @casualshare.attributes
    end

    assert_redirected_to casualshare_path(assigns(:casualshare))
  end

  test "should show casualshare" do
    get :show, id: @casualshare.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @casualshare.to_param
    assert_response :success
  end

  test "should update casualshare" do
    put :update, id: @casualshare.to_param, casualshare: @casualshare.attributes
    assert_redirected_to casualshare_path(assigns(:casualshare))
  end

  test "should destroy casualshare" do
    assert_difference('Casualshare.count', -1) do
      delete :destroy, id: @casualshare.to_param
    end

    assert_redirected_to casualshares_path
  end
end
