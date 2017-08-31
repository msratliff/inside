class Promotion < ApplicationRecord
  belongs_to :venue
  has_many :transactions
end
