# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# add Users
User.create!(username: "Kuba", email: "jjkazm@gmail.com", password:"haslo", admin: true)
5.times do
  User.create!(username: Faker::Internet.unique.username, email: Faker::Internet.unique.safe_email, password:"haslo")
end


# add Articles
4.times do
  Article.create!(title: Faker::Coffee.unique.blend_name, description: Faker::Lebowski.unique.quote, user_id: 1)
end

10.times do
  Article.create!(title: Faker::Coffee.unique.blend_name, description: Faker::Lebowski.unique.quote, user_id: rand(2..6))
end

category = ["sports", "news", "politics", "environment", "travel", "programming", "tech", "animals", "books", "cooking"]
category.each do |cat|
  Category.create(name: cat)
end

i = 0
while i < 20
  art = rand(1..Article.count)
  cat = rand(1..Category.count)
  if !ArticleCategory.where(article_id: art, category_id: cat).exists?
    ArticleCategory.create(article_id: art, category_id: cat)
    i += 1
  end
end
