class RenameCustIDtoStripeId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :customer_id, :stripe_id

  end
end
