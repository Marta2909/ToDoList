class TasksController < ApplicationController
  def index
    @tasks = Task.order(deadline: :ASC)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      flash[:notice] = 'All fields are required. Try again'
      render :new
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
