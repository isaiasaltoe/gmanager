class AddTeamRefToClients < ActiveRecord::Migration[8.1]
  def change
    add_reference :clients, :team, null: false, foreign_key: true
  end
end
