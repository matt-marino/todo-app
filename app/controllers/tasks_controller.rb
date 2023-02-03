# typed: false
# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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
      .permit(:title, :description, :priority, :completed, :due_date)
  end
end
# you are on the One-to-Many: Forms section of the course
# /rails/info/routes is how you access what is available in the routes
