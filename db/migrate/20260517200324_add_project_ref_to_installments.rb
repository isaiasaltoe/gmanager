class AddProjectRefToInstallments < ActiveRecord::Migration[8.1]
  def change
    add_reference :installments, :project, null: false, foreign_key: true
  end
end
