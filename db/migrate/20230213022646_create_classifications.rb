# frozen_string_literal: true

class CreateClassifications < ActiveRecord::Migration[7.0]
  def change
    create_table(:classifications) do |t|
      t.references(:task, null: false, foreign_key: true)
      t.references(:group, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
