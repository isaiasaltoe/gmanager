class CreateInstallments < ActiveRecord::Migration[8.1]
  def change
    create_table :installments do |t|
      t.integer :number
      t.integer :value
      t.integer :status
      t.date :due_date, null: true
      t.date :paid_at, null: true

      t.timestamps
    end
  end
end
