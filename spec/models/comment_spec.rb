require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'create a valid comment' do
    comment = create(:comment)
    expect(comment).to be_valid
  end
end
