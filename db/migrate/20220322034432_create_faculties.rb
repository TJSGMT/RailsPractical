class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone_no
      t.string :email
      t.string :designation

      t.timestamps
    end
  end
end
