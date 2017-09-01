class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :payment_method, foreign_key: true
      t.references :promotion, foreign_key: true

      t.timestamps
    end
  end
end
