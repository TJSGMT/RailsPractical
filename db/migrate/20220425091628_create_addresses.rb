class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :Addresses
      t.belongs_to :user , foreign_key: true , null:false

      t.timestamps
    end
  end
end
