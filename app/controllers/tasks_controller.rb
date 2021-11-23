class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    #@task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)
    redirect_to task_path(@new_task) if @new_task.save
  end

  def edit
    #@edit_task = Task.find(params[:id])
  end

  def update
    #@update_task = Task.find(params[:id])
    redirect_to task_path(@task) if @task.update(task_params)
  end

  def destroy
    #@delete_task = Task.find(params[:id])
    redirect_to tasks_path if @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
