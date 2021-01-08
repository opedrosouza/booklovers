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
    it 'Visit categories show' do
      category = create(:category)
      visit category_path(category)
      expect(page).to have_text("Livros da categoria: #{category.title}") 
    end
    it 'visit the new page and create a new category' do
      visit new_category_path
      fill_in 'Título',	with: 'Category test' 
      fill_in 'Descricão',	with: 'Category test desc' 
      click_button 'Salvar'
      expect(page).to have_text('Categoria cadastrada com sucesso.') 
    end
    it 'visit the edit page and update a category' do
      category = create(:category)
      visit edit_category_path(category)
      fill_in 'Título',	with: 'Category test edit' 
      fill_in 'Descricão',	with: 'Category test desc edit' 
      click_button 'Salvar'
      expect(page).to have_text('Categoria atualizada com sucesso.') 
    end
    it 'visit the index page and delete a category' do
      category = create(:category)
      visit categories_path
      find(:css, "a[href='#{category_path(category.id)}'][data-method='delete']").click
      expect(page).to have_text('Categoria removida com sucesso.') 
    end
  end

  context 'As guest user' do
    it 'Visit categories index' do
      visit categories_path
      expect(page).to have_text('You need to sign in or sign up before continuing') 
    end
  end
end
