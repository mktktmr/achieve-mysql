# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = email.match(/(.*)@/)[1]
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name
               )
end

User.all.each do |user|

  Blog.create! title: "title by " + user.name,
               content: "content by " + user.name,
               user_id: user.id
end
