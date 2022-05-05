class AddReferenceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :product1
    add_reference :orders, :customer
  end
end
