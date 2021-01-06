FactoryBot.define do
  factory :comment do
    book { create(:book) }
    member  { create(:user) }
  end
end