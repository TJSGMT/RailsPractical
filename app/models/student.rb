class Student < ApplicationRecord
  after_initialize do |student|
    puts "you've initialized an object!"
  end

  after_find do |student|
    puts "you've found an object "
  end

  after_create do |student|
    puts "The object is created"
  end

  after_update do |stduent|
    puts "New changes have been made"
  end

  after_destroy do |student|
    puts "Data's been wiped outttttttttt"
  end

  before_validation do |student|
    puts "please enter Birthdate properly"
  end

  after_create :email_added
  after_update :email_added
  private
  def email_added 
    puts "Email is being validated and Added sucessfully"
  end

  after_destroy :Delete_data, if: :delete_data?
  
  def Delete_data
    puts "Data is deleted"
  end
  def delete_data?  
    if Student.count>2
      return true
    else
      return false
    end
  end

  after_touch :touched
  def touched
    puts "objetct was touched"
  end

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence:true
  validates :firstname, :lastname, presence:true
  validates :birthdate, comparison:{less_than: Date.today}
  validates :terms_of_usage, acceptance: true
  validates :department, inclusion: { in: %w(IT CE),message: "%{value} is not an option for you to choose " }
end
