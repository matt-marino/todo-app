# typed: false
# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @fans = @task.fans
    @groups = @task.groups.order(:name)
    if current_user
      @favorite = current_user.favorites.find_by(task_id: @task.id)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to(@task, notice: "Task successfully updated!")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to(@task, notice: "Task successfully created!")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_url, status: :see_other, notice: "Task successfully deleted!")
  end

  private

  def task_params
    params.require(:task)
      .permit(:title, :description, :priority, :completed, :due_date, group_ids: [])
  end
end
