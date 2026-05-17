class AddTeamRefToInvites < ActiveRecord::Migration[8.1]
  def change
    add_reference :invites, :team, null: false, foreign_key: true
  end
end
