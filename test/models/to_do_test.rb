require 'test_helper'

class ToDoTest < ActiveSupport::TestCase
  test "check if to_do has content" do
    todo = ToDo.new(due_on: 2015-02-27, order: 1, complete: false)
    assert_not todo.save
  end
  
end
