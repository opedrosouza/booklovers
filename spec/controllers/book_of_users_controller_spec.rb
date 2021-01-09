require "rails_helper"

RSpec.describe BookOfUsersController, type: :controller do
  context 'As authenticated user' do
    render_views
    login_user
    describe "POST create" do
      let!(:book) { create(:book) }
      it "Redirect Success" do
        post :create, xhr: true, params: { book_of_user: { book_id: book.id, user: subject.current_user, status: 'readed' } }
        expect(response.body).to match /Livro adicionado com sucesso a sua colecão./
      end

      it "Render failure" do
        post :create, xhr: true, params: { book_of_user: { book_id: book.id, user: subject.current_user} }
        expect(response.body).to match /["Status can't be blank"]./
      end
    end
  end
end
