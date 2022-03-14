class AddDataToAuhtors < ActiveRecord::Migration[7.0]
  def change
    Author.create(first_name: "Hello", last_name: "World", email: "abc@test.com")
    Author.create(first_name: "tjs", last_name: "gmt", email: "tjs@aduhhh.com")

    Book.create(name:"the mdoern breakups",price:"5.02",id:3)
  end
end
