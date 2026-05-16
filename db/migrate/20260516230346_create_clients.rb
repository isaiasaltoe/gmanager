class CreateClients < ActiveRecord::Migration[8.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.string :site
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
