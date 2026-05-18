class ChangeFullNameNotNullOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :full_name, false 
  end
end
