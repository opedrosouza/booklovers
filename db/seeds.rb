# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
5.times.each_with_index do |i|
  cat = Category.create(title: "Testcat#{i}", description: "Testdesc#{i}")
  10.times.each do
    Book.create(title: Faker::Book.title, description: Faker::Books::Lovecraft.paragraph, author_name: Faker::Book.author, category: cat)
  end
end

Admin.create(email: 'pedro@mail.com', password: '123123', password_confirmation: '123123')
User.create(name: 'Pedro Souza', email: 'pedro@mail.com', password: '123123', password_confirmation: '123123')