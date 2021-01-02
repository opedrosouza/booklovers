require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'create a valid book' do
    book = create(:book)
    expect(book).to be_valid
  end

  context 'Validations' do  
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:author_name) }
  end
end
