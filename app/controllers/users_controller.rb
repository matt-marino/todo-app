# typed: false
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.not_admins
  end

  def show
    @ratings = @user.task_ratings
    @favorite_tasks = @user.favorite_tasks
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(@user, notice: "User successfully created!")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to(@user, notice: "User successfully updated!")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    redirect_to(
      root_url,
      status: :see_other,
      alert: "Account successfully deleted!",
    )
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation, :username)
  end

  def require_correct_user
    @user = User.find_by!(slug: params[:id])
    unless current_user == @user
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
  end

  def set_user
    @user = User.find_by!(slug: params[:id])
  end
end
