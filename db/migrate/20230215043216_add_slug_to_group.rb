class AddSlugToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :slug, :string
  end
end
