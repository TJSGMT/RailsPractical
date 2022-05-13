class Removeforeignkey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :events, :users
  end
end
