class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :quantity
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
