require 'test_helper'

class CasualcommentsControllerTest < ActionController::TestCase
  setup do
    @casualcomment = casualcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casualcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create casualcomment" do
    assert_difference('Casualcomment.count') do
      post :create, casualcomment: @casualcomment.attributes
    end

    assert_redirected_to casualcomment_path(assigns(:casualcomment))
  end

  test "should show casualcomment" do
    get :show, id: @casualcomment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @casualcomment.to_param
    assert_response :success
  end

  test "should update casualcomment" do
    put :update, id: @casualcomment.to_param, casualcomment: @casualcomment.attributes
    assert_redirected_to casualcomment_path(assigns(:casualcomment))
  end

  test "should destroy casualcomment" do
    assert_difference('Casualcomment.count', -1) do
      delete :destroy, id: @casualcomment.to_param
    end

    assert_redirected_to casualcomments_path
  end
end
