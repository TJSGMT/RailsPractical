class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :liked_by
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
