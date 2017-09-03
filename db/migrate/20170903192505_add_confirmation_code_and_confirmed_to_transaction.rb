class AddConfirmationCodeAndConfirmedToTransaction < ActiveRecord::Migration[5.1]
  def change
  	add_column :transactions, :confirmation_code, :string
  	add_column :transactions, :confirmed, :boolean
  end
end
