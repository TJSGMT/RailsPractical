class Student < ApplicationRecord
   validates :firstname, :lastname, presence:true
   validates :birthdate, comparison:{less_than: Date.today}
   validates :terms_of_usage, acceptance: true
   validates :department, inclusion: { in: %w(IT CE),message: "%{value} is not an option for you to choose " }
end
