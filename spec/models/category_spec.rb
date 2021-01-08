require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'create a valid category' do
    category = create(:category)
    expect(category).to be_valid
  end

  context 'Validations' do  
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
