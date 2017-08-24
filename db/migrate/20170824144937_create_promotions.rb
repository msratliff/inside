class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :day_of_week
      t.time :time
      t.integer :price
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
