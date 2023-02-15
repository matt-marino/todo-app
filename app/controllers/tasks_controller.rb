# typed: false
# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.send(tasks_filter)
  end

  def show
    @task = Task.find_by!(slug: params[:id])
    @fans = @task.fans
    @groups = @task.groups.order(:name)
    if current_user
      @favorite = current_user.favorites.find_by(task_id: @task.id)
    end
  end

  def edit
  end

  def update
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
    @task.destroy
    redirect_to(tasks_url, status: :see_other, notice: "Task successfully deleted!")
  end

  private

  def task_params
    params.require(:task)
      .permit(:title, :description, :priority, :completed, :due_date, group_ids: [])
  end

  def tasks_filter
    if params[:filter].in?(["upcoming", "recent", "recent_results", "completed", "incomplete"])
      params[:filter]
    else
      :all_tasks
    end
  end

  def set_task
    @task = Task.find_by!(slug: params[:id])
  end
end
