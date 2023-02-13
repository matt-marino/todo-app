# frozen_string_literal: true

class MakeTaskRatingsAJoinTable < ActiveRecord::Migration[7.0]
  def change
    remove_column(:task_ratings, :name, :string)
    add_column(:task_ratings, :user_id, :integer)
    TaskRating.delete_all
  end
end
