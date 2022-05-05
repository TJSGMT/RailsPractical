class Category < ApplicationRecord
  has_many :events ,dependent: :destroy
  enum :category, [:music, :fashion, :expo, :competition]
end
