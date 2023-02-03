# frozen_string_literal: true

class AddFieldsToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column(:tasks, :due_date, :date)
    add_column(:tasks, :description, :text)
  end
end
