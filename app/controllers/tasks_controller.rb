class TasksController < ApplicationController
  def index
    @tasks = Task.order(deadline: :ASC)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.assign_attributes({:finished => "false"})
    if @task.save
      redirect_to root_path
    else
      render action: "new"
    end
  end

  def multi_delete
    Task.destroy(params[:tasks])
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :priority, :deadline)
  end
end
