# typed: false
# frozen_string_literal: true

class TaskRatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :destroy]
  before_action :set_task, only: [:edit, :index, :new, :create]
  def index
    @task = Task.find(params[:task_id])
    @ratings = @task.task_ratings
  end

  def show
    @ratings = TaskRating.find(params[:id])
    @task = Task.find(params[:task_id])
    @rating = @task.task_ratings.new
  end

  def new
    @task = Task.find(params[:task_id])
    @rating = @task.task_ratings.new
  end

  def edit
    @task = Task.find(params[:task_id])
    @rating = @task.task_ratings.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @rating = @task.task_ratings.find(params[:id])
    if @rating.update(task_rating_params)
      redirect_to(task_task_ratings_path(@task), notice: "Rating successfully updated!")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def create
    @task = Task.find(params[:task_id])
    @rating = @task.task_ratings.new(task_rating_params)
    if @rating.save
      redirect_to(task_task_ratings_path(@task), notice: "Thanks for your rating!")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @rating.destroy
    @task = Task.find(params[:task_id])
    redirect_to(task_task_ratings_path(@task), status: :see_other, notice: "Rating successfully deleted!")
  end

  private

  def task_rating_params
    params.require(:task_rating).permit(:name, :comment, :stars)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_rating
    @rating = TaskRating.find(params[:id])
  end
end
