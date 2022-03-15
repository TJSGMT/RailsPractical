class ChangeAuthorsDob < ActiveRecord::Migration[7.0]
  def change
    change_column :authors, :dob, :date
  end
end
