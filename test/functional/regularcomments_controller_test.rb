require 'test_helper'

class RegularcommentsControllerTest < ActionController::TestCase
  setup do
    @regularcomment = regularcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regularcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regularcomment" do
    assert_difference('Regularcomment.count') do
      post :create, regularcomment: @regularcomment.attributes
    end

    assert_redirected_to regularcomment_path(assigns(:regularcomment))
  end

  test "should show regularcomment" do
    get :show, id: @regularcomment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regularcomment.to_param
    assert_response :success
  end

  test "should update regularcomment" do
    put :update, id: @regularcomment.to_param, regularcomment: @regularcomment.attributes
    assert_redirected_to regularcomment_path(assigns(:regularcomment))
  end

  test "should destroy regularcomment" do
    assert_difference('Regularcomment.count', -1) do
      delete :destroy, id: @regularcomment.to_param
    end

    assert_redirected_to regularcomments_path
  end
end
