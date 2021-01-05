require "rails_helper"

RSpec.describe Layout::Navbar::Component, type: :view do
  describe 'Render with logged admin' do
    subject(:component) { described_class.new(user: create(:admin)) }
    it 'render navbar' do
      render(component)
      expect(rendered).to have_link("Novo Livro", href: new_book_path)
    end
  end

  describe 'Render without logged admin' do
    subject(:component) { described_class.new() }
    it 'render navbar' do
      render(component)
      expect(rendered).to have_link("BookLovers", href: root_path)
    end
  end
  
  
end
