class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :user, add_foreign_key:true
      t.belongs_to :event, add_foreign_key:true
      
      t.timestamps
    end
  end
end
