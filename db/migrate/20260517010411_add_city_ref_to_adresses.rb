class AddCityRefToAdresses < ActiveRecord::Migration[8.1]
  def change
    add_reference :adresses, :city, null: false, foreign_key: true
  end
end
