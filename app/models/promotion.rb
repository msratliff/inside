class Promotion < ApplicationRecord
  
  belongs_to :venue
  has_many :transactions
  validates :day_of_week, :price, :time, presence: true

end
