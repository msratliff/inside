class ChangeLatLongtoFloat < ActiveRecord::Migration[5.1]
  def change
  	change_column :venues, :latitude, :float
  	change_column :venues, :longitude, :float
  end
end
