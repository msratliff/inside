class ChangeConfirmedName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :transactions, :confirmed, :active
  end
end
