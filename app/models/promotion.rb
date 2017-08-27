class Promotion < ApplicationRecord
  
  belongs_to :venue
  validates :day_of_week, :price, :time, presence: true

end
