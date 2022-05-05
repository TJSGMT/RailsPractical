class CreateCustomerrs < ActiveRecord::Migration[7.0]
  def change
    create_table :customerrs do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :ph_no

      t.timestamps
    end
  end
end
