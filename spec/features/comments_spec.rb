require 'rails_helper'

RSpec.feature "Comments Feature Tests", js: true, type: :feature do
  context 'As logged user' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
    it 'Add a comment' do
      book = create(:book)
      visit book_path(book.id)
      find(:css, "trix-editor").set('Comentário teste')
      click_button 'Comentar'
      expect(page).to have_text('Comentário adicionado com sucesso.') 
    end
    it 'Remove a comment' do
      book = create(:book)
      comment = create(:comment, member: @user, book: book)

      visit book_path(book.id)
      find(:css, "a[href='#{comment_path({ id: comment.id, book_id: book.id })}']").click
      accept_alert
      expect(page).to have_text('Comentário removido com sucesso.') 
    end
  end

  context 'As logged admin' do
    before(:each) do
      @admin = create(:admin)
      sign_in @admin
    end

    it 'Add a comment' do
      book = create(:book)
      visit book_path(book.id)
      f = find(:css, "trix-editor").set('Comentário teste')
      click_button 'Comentar'
      expect(page).to have_text('Comentário adicionado com sucesso.') 
    end

    it 'Remove a comment' do
      book = create(:book)
      comment = create(:comment, member: @admin, book: book)

      visit book_path(book.id)
      find(:css, "a[href='#{comment_path({ id: comment.id, book_id: book.id })}']").click
      accept_alert
      expect(page).to have_text('Comentário removido com sucesso.') 
    end
  end
end
