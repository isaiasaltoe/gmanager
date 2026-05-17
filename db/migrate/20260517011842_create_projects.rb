class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :status
      t.string :description, null: true
      t.string :repo, null: true
      t.date :finish_date, null: true
      t.integer :total_value
      t.integer :installments_qty

      t.timestamps
    end
  end
end
