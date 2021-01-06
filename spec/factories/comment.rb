FactoryBot.define do
  factory :comment do
    book { create(:book) }
    member  { create(:user) }
    content { 'simple comment' }
  end
end