class AddcolumnTofaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :birthdate, :date
  end
end
