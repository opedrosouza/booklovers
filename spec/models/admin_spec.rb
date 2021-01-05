require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'create a valid admin' do
    admin = create(:admin)
    expect(admin).to be_valid
  end

  context 'Validations' do  
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
