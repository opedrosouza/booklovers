FactoryBot.define do
  factory :book_of_user do
    user { create(:user) }
    book  { create(:book) }
    status { 'readed' }
  end
end