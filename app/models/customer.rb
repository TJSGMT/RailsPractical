class Customer < ApplicationRecord
    validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence: true
    has_many :orders,dependent: :destroy
end
