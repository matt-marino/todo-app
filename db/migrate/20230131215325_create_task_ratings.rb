# frozen_string_literal: true

class CreateTaskRatings < ActiveRecord::Migration[7.0]
  def change
    create_table(:task_ratings) do |t|
      t.string(:name)
      t.integer(:stars)
      t.text(:comment)
      t.references(:task, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
