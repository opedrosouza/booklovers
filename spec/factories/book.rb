FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description  { Faker::Books::Lovecraft.paragraph }
    author_name { Faker::Book.author }
  end
end