require 'rails_helper'

RSpec.feature "Users Books Feature Tests", type: :feature do

  context 'As logged user' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
    it 'Visit /users/index' do
      visit users_books_path
      expect(page).to have_text('Meus Livros') 
    end
  end

  context 'As guest user' do
    it 'Visit /users/index' do
      visit users_books_path
      expect(page).to have_text('You need to sign in or sign up before continuing') 
    end
  end
end
