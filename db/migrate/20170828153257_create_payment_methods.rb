class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.references :user, foreign_key: true
      t.string :card_token
      t.string :card_last_four

      t.timestamps
    end
  end
end
