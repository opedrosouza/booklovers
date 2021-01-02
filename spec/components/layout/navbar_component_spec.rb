require "rails_helper"

RSpec.describe Layout::Navbar::Component, type: :view do
  subject(:component) { described_class.new }

  it 'render navbar' do
    render(component)
    expect(rendered).to have_link("BookLovers", href: root_path)
  end
  
end
