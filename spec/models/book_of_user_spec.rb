require 'rails_helper'

RSpec.describe BookOfUser, type: :model do
  it 'create a valid book_of_user' do
    book_of_user = create(:book_of_user)
    expect(book_of_user).to be_valid
  end

  context 'Validations' do  
    it { should validate_presence_of(:status) }
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
