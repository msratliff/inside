class Promotion < ApplicationRecord
  
  belongs_to :venue
  has_many :transactions
  validates :name, :day_of_week, :price, :time, presence: true

  scope :day_of_week_order, -> { order(
			"CASE day_of_week WHEN 'Sunday' THEN 0 " \
	    "WHEN 'Monday' THEN 1 " \
	    "WHEN 'Tuesday' THEN 2 " \
	    "WHEN 'Wednesday' THEN 3 " \
	    "WHEN 'Thursday' THEN 4 " \
	    "WHEN 'Friday' THEN 5 " \
	    "WHEN 'Saturday' THEN 6 END") }

end
