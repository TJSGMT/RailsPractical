class Event < ApplicationRecord
  has_many :users, through: :enrollments
  has_many :enrollments
  has_many :comments, dependent: :destroy
  belongs_to :category
end
