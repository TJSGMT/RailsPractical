class Faculty < ApplicationRecord
  validates :firstname, :lastname, :email, presence:true
  validates :phone_no, length: { is: 10 }
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence:true
  validates :birthdate, comparison:{less_than: Date.today}
  validates :designation, inclusion: { in: %w(Ass.prof Prof),message: "Ass.prof and Prof Are the only designations you can choose" }
  validates :designation, exclusion: { in: %w(HOD Sr.prof),message: "You have no rights for these designation" }
end
