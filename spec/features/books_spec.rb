require 'rails_helper'

RSpec.feature "Books Feature Tests", type: :feature do
  context 'As guest user' do
    it 'Visit root page' do
      visit root_path
      expect(page).to have_text('O webapp perfeito para amantes de livros.') 
    end
    it 'Visit show page' do
      book = create(:book)
      visit book_path(book.id)
      expect(page).to_not have_text('Remover') 
    end
    it "Can't visit the new page" do
      visit new_book_path
      expect(page).to have_text('You need to sign in or sign up before continuing') 
    end
    it "Can't visit the edit page" do
      book = create(:book)
      visit edit_book_path(book.id)
      expect(page).to have_text('You need to sign in or sign up before continuing') 
    end
  end

  context 'As logged admin' do
    before(:each) do
      sign_in create(:admin)
    end
    it 'Visit root page' do
      visit root_path
      expect(page).to have_text('O webapp perfeito para amantes de livros.') 
    end
    it 'Visit show page' do
      book = create(:book)
      visit book_path(book.id)
      expect(page).to have_text('Remover') 
    end
    it 'visit the new page and create a new book' do
      visit new_book_path
      fill_in 'Título',	with: 'A feature tested book' 
      fill_in 'Descricão',	with: 'A man that dont like write tests lol' 
      fill_in 'Nome do Autor',	with: 'Unknown'
      click_button 'Salvar'
      expect(page).to have_text('Livro cadastrado com sucesso.') 
    end
    it 'visit the edit page and update a book' do
      book = create(:book)
      visit edit_book_path(book.id)
      fill_in 'Título',	with: 'A feature tested book with editions' 
      fill_in 'Descricão',	with: 'A man that dont like write tests lol' 
      fill_in 'Nome do Autor',	with: 'Unknown'
      click_button 'Salvar'
      expect(page).to have_text('Livro atualizado com sucesso.') 
    end
    it 'visit the show page and remove a book' do
      book = create(:book)
      visit book_path(book.id)
      click_link 'Remover'
      expect(page).to have_text('Livro removido com sucesso.') 
    end
  end
end
