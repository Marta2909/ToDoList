require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_path
    assert_response :success
    assert_not_nil assigns(:tasks)
    assert Task.all.each_cons(2).all?{|i,j| i.deadline <= j.deadline}
  end

#  test "should get edit" do
#    get edit_task_path
#    assert_response :success
#  end

  test "should get new" do
    get new_task_path
    assert_response :success
    assert_not_nil assigns(:task)
  end

  test "should create a task" do
    assert_difference 'Task.count', 1 do
      post "/tasks", params: { task: { name: "zadanie", priority: "zwykłe", deadline: Date.tomorrow } }
    end
    assert_redirected_to root_path
  end

  test "should delete multi tasks" do
    task = Task.new(name: "t1", priority: "ważne", deadline: Date.today, finished: true)
    assert_difference 'Task.count' do
      task.destroy
    end
    assert_redirected_to root_path
  end
end
