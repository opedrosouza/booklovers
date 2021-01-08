require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  context 'As authenticated admin' do
    render_views
    login_admin
    describe "POST create" do
      it "Render Success" do
        book = create(:book)
        post :create, xhr: true, params: { book_id: book.id, comment: { content: 'test comment', member: subject.current_admin } }
        expect(response.body).to match /Comentário adicionado com sucesso./
      end
      
      it "Render failure" do
        book = create(:book)
        post :create, xhr: true, params: { book_id: book.id, comment: { content: '', member: subject.current_admin } }
        expect(response.body).to match /["Content can't be blank"]./
      end
    end

    describe "DELETE destroy" do
      it "Render Success" do
        book = create(:book)
        comment = create(:comment, member: subject.current_admin)
        delete :destroy, xhr: true, params: { book_id: book.id, id: comment.id }
        expect(response.body).to match /Comentário removido com sucesso./
      end
    end
  end

  context 'As authenticated user' do
    render_views
    login_user
    describe "POST create" do
      it "Render Success" do
        book = create(:book)
        post :create, xhr: true, params: { book_id: book.id, comment: { content: 'test comment', member: subject.current_user } }
        expect(response.body).to match /Comentário adicionado com sucesso./
      end
      
      it "Render failure" do
        book = create(:book)
        post :create, xhr: true, params: { book_id: book.id, comment: { content: '', member: subject.current_user } }
        expect(response.body).to match /["Content can't be blank"]./
      end
    end
    
    describe "DELETE destroy" do
      it "Render Success" do
        book = create(:book)
        comment = create(:comment, member: subject.current_user)
        delete :destroy, xhr: true, params: { book_id: book.id, id: comment.id }
        expect(response.body).to match /Comentário removido com sucesso./
      end
    end
  end
end
