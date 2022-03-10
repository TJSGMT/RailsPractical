class Author < ApplicationRecord
    validates :first_name, presence: true
    validates :name, uniqueness: true
    validates :last_name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
