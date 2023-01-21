class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :update]
  before_action :get_tasks

  def index
    render json: @tasks, except: [:created_at, :updated_at] 
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @tasks, except: [:created_at, :updated_at], status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: @tasks, except: [:created_at, :updated_at] 
  end

  def update
    if @task.update(task_params)
      render json: @tasks, except: [:created_at, :updated_at] 
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :description, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def get_tasks
    @tasks = @current_user.tasks.order(:created_at)
  end
end
