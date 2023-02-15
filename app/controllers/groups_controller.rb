# typed: false
# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
    @tasks = @group.tasks.order(:title)
    if current_user
      # @favorite = current_user.favorites.find_by(group_id: @group.id)
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to(@group, notice: "Group successfully updated!")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to(@group, notice: "Group successfully created!")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @group.destroy
    redirect_to(groups_url, status: :see_other, notice: "Group successfully deleted!")
  end

  private

  def group_params
    params.require(:group)
      .permit(:name, task_ids: [])
  end

  def set_group
    @group = Group.find_by!(slug: params[:id])
  end
end
