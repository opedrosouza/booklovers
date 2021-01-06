require "rails_helper"

RSpec.describe Layout::Navbar::Component, type: :view do
  describe 'Render with logged admin' do
    subject(:component) { described_class.new(member: create(:admin)) }
    it 'render navbar' do
      render(component)
      expect(rendered).to have_link("Novo Livro", href: new_book_path)
    end
  end

  describe 'Render with logged user' do
    subject(:component) { described_class.new(member: create(:user)) }
    it 'render navbar' do
      render(component)
      expect(rendered).to have_link("Sair", href: destroy_user_session_path)
    end
  end

  describe 'Render without logged member' do
    subject(:component) { described_class.new() }
    it 'render navbar' do
      render(component)
      expect(rendered).to have_link("BookLovers", href: root_path)
    end
  end
  
  
end
