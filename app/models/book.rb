class Book < ApplicationRecord
    belongs_to :author, autosave: true
    has_many :images, as: :imageable
end
    