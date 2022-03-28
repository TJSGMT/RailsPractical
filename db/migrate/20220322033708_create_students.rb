class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :birthdate
      t.string :department
      t.string :terms_of_usage

      t.timestamps
    end
  end
end
