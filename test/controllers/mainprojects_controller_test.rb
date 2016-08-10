require 'test_helper'

class MainprojectsControllerTest < ActionController::TestCase
  setup do
    @mainproject = mainprojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainprojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainproject" do
    assert_difference('Mainproject.count') do
      post :create, mainproject: { company: @mainproject.company, name: @mainproject.name, user_id: @mainproject.user_id }
    end

    assert_redirected_to mainproject_path(assigns(:mainproject))
  end

  test "should show mainproject" do
    get :show, id: @mainproject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mainproject
    assert_response :success
  end

  test "should update mainproject" do
    patch :update, id: @mainproject, mainproject: { company: @mainproject.company, name: @mainproject.name, user_id: @mainproject.user_id }
    assert_redirected_to mainproject_path(assigns(:mainproject))
  end

  test "should destroy mainproject" do
    assert_difference('Mainproject.count', -1) do
      delete :destroy, id: @mainproject
    end

    assert_redirected_to mainprojects_path
  end
end
