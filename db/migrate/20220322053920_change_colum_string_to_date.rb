class ChangeColumStringToDate < ActiveRecord::Migration[7.0]
  def up
      change_column :students, :birthdate, :date
     
  end
  def down
    change_column :students, :birthdate, :string
    

end
end
