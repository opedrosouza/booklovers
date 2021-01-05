FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description  { Faker::Books::Lovecraft.paragraph }
    author_name { Faker::Book.author }
    cover { fixture_file_upload 'spec/fixtures/cleancode.jpg', 'image/jpg' }
  end
end