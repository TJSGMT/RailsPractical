class Addflagforuser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :flag, :boolean ,default: false
  end
end
