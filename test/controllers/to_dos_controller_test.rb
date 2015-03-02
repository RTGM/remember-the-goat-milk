require 'test_helper'

class ToDosControllerTest < ActionController::TestCase
  setup do
    @to_do = to_dos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_do" do
    assert_difference('ToDo.count') do
      post :create, to_do: { due_on: @to_do.due_on, content: @to_do.content, complete: @to_do.complete }
    end

    assert_redirected_to root_path
  end

  test "should get edit" do
    get :edit, id: @to_do
    assert_response :success
  end

  test "should update to_do" do
    patch :update, id: @to_do, to_do: { due_on: @to_do.due_on, order: @to_do.order, content: @to_do.content, complete: @to_do.complete }
    assert_redirected_to root_path
  end

  test "should destroy to_do" do
    assert_difference('ToDo.count', -1) do
      delete :destroy, id: @to_do
    end

    assert_redirected_to root_path
  end
end
