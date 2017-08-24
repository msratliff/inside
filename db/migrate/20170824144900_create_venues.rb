class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
    add_index :venues, :email, unique: true
  end
end
