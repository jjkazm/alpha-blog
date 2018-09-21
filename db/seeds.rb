# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# # add Users
# User.create!(username: "Kuba", email: "jjkazm@gmail.com", password:"haslo", admin: true)
# 5.times do
#   User.create!(username: Faker::Internet.unique.username, email: Faker::Internet.unique.safe_email, password:"haslo")
# end
#
#
# # add Articles
# 4.times do
#   Article.create!(title: Faker::Coffee.unique.blend_name, description: Faker::Lebowski.unique.quote, user_id: 1)
# end
#
# 10.times do
#   Article.create!(title: Faker::Coffee.unique.blend_name, description: Faker::Lebowski.unique.quote, user_id: rand(2..6))
# end
10.times do
  Category.create!(name: Faker::Color.unique.color_name)
end
