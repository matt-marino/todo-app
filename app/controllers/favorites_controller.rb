# typed: false
# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_task
  def create
    @task.favorites.create!(user: current_user)

    # or append to the through association
    # @task.fans << current_user

    redirect_to(@task)
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy

    redirect_to(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
