class Transaction < ApplicationRecord
  
  belongs_to :payment_method
  belongs_to :promotion
  
end
