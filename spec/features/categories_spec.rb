require 'rails_helper'

RSpec.feature "Categories Feature Tests", type: :feature do
  context 'As logged admin' do
    before(:each) do
      sign_in create(:admin)
    end
    it 'Visit categories index' do
      visit categories_path
      expect(page).to have_text('Categorias') 
    end
    it 'visit the new page and create a new book' do
      visit new_category_path
      fill_in 'Título',	with: 'Category test' 
      fill_in 'Descricão',	with: 'Category test desc' 
      click_button 'Salvar'
      expect(page).to have_text('Categoria cadastrada com sucesso.') 
    end
  end

  context 'As guest user' do
    it 'Visit categories index' do
      visit categories_path
      expect(page).to have_text('You need to sign in or sign up before continuing') 
    end
  end
end
