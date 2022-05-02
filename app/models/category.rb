class Category < ApplicationRecord
  has_many :events 
  enum :category, [:music, :fashion, :expo, :competition]
end
