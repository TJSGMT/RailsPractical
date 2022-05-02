class User < ApplicationRecord
  has_secure_password
  validates :Username, presence: true, uniqueness: true
  has_many :events, through: :enrollments 
  has_many :enrollments
  has_one :address    
  has_many :comments, dependent: :destroy 
end
