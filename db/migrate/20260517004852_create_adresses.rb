class CreateAdresses < ActiveRecord::Migration[8.1]
  def change
    create_table :adresses do |t|
      t.integer :number, null: true
      t.string :street
      t.string :cep

      t.timestamps
    end
  end
end
