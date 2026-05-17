class AddUserRefToInvites < ActiveRecord::Migration[8.1]
  def change
    add_reference :invites, :user, null: false, foreign_key: true
  end
end
