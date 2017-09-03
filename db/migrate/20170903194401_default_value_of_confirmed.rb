class DefaultValueOfConfirmed < ActiveRecord::Migration[5.1]
  def change
  	change_column :transactions, :confirmed, :boolean, :default => true
  end
end
