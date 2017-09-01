class AddDescriptionToVenueAndNameToPromotion < ActiveRecord::Migration[5.1]
  def change
  	add_column :venues, :description, :text
  	add_column :promotions, :name, :string
  	add_column :promotions, :description, :text
  end
end
