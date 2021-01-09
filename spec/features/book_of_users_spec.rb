require 'rails_helper'

RSpec.feature "BookOfUser Feature Tests", js: true, type: :feature do
  context 'As logged user' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
    it 'Add book to collection' do
      book = create(:book)
      visit book_path(book.id)
      find(:css, "a[href='#{book_of_users_path({ book_of_user: { book_id: book.id, status: 'readed' } })}'][data-method='post']").click
      expect(page).to have_text('Livro adicionado com sucesso a sua colecão.') 
    end
  end

  context 'As guest user' do
    it 'Add book to collection' do
      book = create(:book)
      visit book_path(book.id)
      find(:css, "a[href='#{book_of_users_path({ book_of_user: { book_id: book.id, status: 'readed' } })}'][data-method='post']").click
      expect(page).to have_text('Você precisa fazer login.') 
    end
  end
end
