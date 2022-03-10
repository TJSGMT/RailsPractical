class AddColumnToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :age, :string
  end
end
