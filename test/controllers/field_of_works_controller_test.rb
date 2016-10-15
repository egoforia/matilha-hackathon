require 'test_helper'

class FieldOfWorksControllerTest < ActionController::TestCase
  setup do
    @field_of_work = field_of_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_of_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_of_work" do
    assert_difference('FieldOfWork.count') do
      post :create, field_of_work: { title: @field_of_work.title }
    end

    assert_redirected_to field_of_work_path(assigns(:field_of_work))
  end

  test "should show field_of_work" do
    get :show, id: @field_of_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_of_work
    assert_response :success
  end

  test "should update field_of_work" do
    patch :update, id: @field_of_work, field_of_work: { title: @field_of_work.title }
    assert_redirected_to field_of_work_path(assigns(:field_of_work))
  end

  test "should destroy field_of_work" do
    assert_difference('FieldOfWork.count', -1) do
      delete :destroy, id: @field_of_work
    end

    assert_redirected_to field_of_works_path
  end
end
