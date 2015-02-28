require 'test_helper'

class ToDosControllerTest < ActionController::TestCase
  setup do
    @todo = to_dos(:one)
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
      post :create, to_do: { due_on: @todo.due_on, content: @todo.content, complete: @todo.complete }
    end

    assert_redirected_to root_path
  end

  test "should get edit" do
    get :edit, id: @todo
    assert_response :success
  end

  test "should update to_do" do
    patch :update, id: @todo, to_do: { due_on: @todo.due_on, order: @todo.order, content: @todo.content, complete: @todo.complete }
    assert_redirected_to root_path
  end

  test "should destroy to_do" do
    assert_difference('ToDo.count', -1) do
      delete :destroy, id: @todo
    end

    assert_redirected_to root_path
  end
end
