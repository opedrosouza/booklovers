require "rails_helper"

RSpec.describe Utils::Alert::Component, type: :view do
  context 'Render with success' do
    subject(:component) { described_class.new(message: 'test', type: 'success') }
    it 'render alert' do
      render(component)
      expect(rendered).to match /test/
    end
  end

  context 'Do not render' do
    subject(:component) { described_class.new() }
    it 'render alert' do
      render(component)
      expect(rendered).to match //
    end
  end
  
end
