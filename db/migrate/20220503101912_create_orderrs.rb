class CreateOrderrs < ActiveRecord::Migration[7.0]
  def change
    create_table :orderrs do |t|
      t.string :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
