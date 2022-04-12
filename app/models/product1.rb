class Product1 < ApplicationRecord
  enum status: {instock:0 ,outofstock:1 ,commingsoon:3}
  default_scope {where('is_active =?',true)}
  has_many :orders, dependent: :destroy
end
