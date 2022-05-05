class Order < ApplicationRecord
  enum status: {booked:0 , cancelled:1}
  belongs_to :product1  
  belongs_to :customer  
end
