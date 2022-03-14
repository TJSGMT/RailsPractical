class AddADataToBooks < ActiveRecord::Migration[7.0]
  def change
    Book.create(name:"the mdoern breakups", price:"5.02", author_id: 1)
  end
end
