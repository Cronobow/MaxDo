class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render action: :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to tasks_path
    else
      render action: :edit
    end
  end

  def done
    @task = Task.find(params[:id])
    @task.done = true
    @task.save

    redirect_to tasks_path
  end

  def not_yet
    @task = Task.find(params[:id])
    @task.done = false
    @task.save

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])

    if Date.today <= @task.duedate
      @task.destroy
    end

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :note, :duedate, :done)
  end

end
