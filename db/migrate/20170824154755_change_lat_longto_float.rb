class ChangeLatLongtoFloat < ActiveRecord::Migration[5.1]
  def change
  	# change_column :venues, :latitude, :float
  	execute 'ALTER TABLE "venues" ALTER COLUMN "latitude" TYPE decimal USING latitude::numeric'
  	# change_column :venues, :longitude, :float
  	execute 'ALTER TABLE "venues" ALTER COLUMN "longitude" TYPE decimal USING longitude::numeric'

  end
end
