# typed: false
# frozen_string_literal: true

class TaskRatingsController < ApplicationController
  before_action :require_signin
  before_action :set_rating, only: [:edit, :destroy]
  before_action :set_task, only: [:edit, :show, :index, :new, :create, :update]
  def index
    @ratings = @task.task_ratings
  end

  def show
    @ratings = TaskRating.find(params[:id])
    @rating = @task.task_ratings.new
  end

  def new
    @rating = @task.task_ratings.new
  end

  def edit
    @rating = @task.task_ratings.find(params[:id])
  end

  def update
    @rating = @task.task_ratings.find(params[:id])
    if @rating.update(task_rating_params)
      redirect_to(task_task_ratings_path(@task), notice: "Rating successfully updated!")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def create
    @rating = @task.task_ratings.new(task_rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to(task_task_ratings_path(@task), notice: "Thanks for your rating!")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @rating.destroy
    redirect_to(task_task_ratings_path(@task), status: :see_other, notice: "Rating successfully deleted!")
  end

  private

  def task_rating_params
    params.require(:task_rating).permit(:comment, :stars)
  end

  def set_task
    @task = Task.find_by!(slug: params[:task_id])
  end

  def set_rating
    @rating = TaskRating.find(params[:id])
  end
end
