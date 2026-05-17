class CreateInvites < ActiveRecord::Migration[8.1]
  def change
    create_table :invites do |t|
      t.integer :status

      t.timestamps
    end
  end
end
