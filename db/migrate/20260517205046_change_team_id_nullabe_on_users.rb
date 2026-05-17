class ChangeTeamIdNullabeOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :team_id, true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)

  end
end
