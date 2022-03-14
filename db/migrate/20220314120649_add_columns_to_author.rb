class AddColumnsToAuthor < ActiveRecord::Migration[7.0]
  def up
      add_column :authors, :salary, :integer
  end
  def down
    remove_column :authors, :salary
  end
end
