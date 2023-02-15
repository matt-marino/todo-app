# frozen_string_literal: true

class AddSlugToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column(:tasks, :slug, :string)
  end
end
