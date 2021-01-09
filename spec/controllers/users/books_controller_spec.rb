require "rails_helper"

RSpec.describe Users::BooksController, type: :controller do
  context 'As authenticated user' do
    login_user
    describe "GET index" do
      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
      it "renders the 'index' template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end

  context 'As guest user' do
    describe "GET index" do
      it "has a 302 status code" do
        get :index
        expect(response.status).to eq(302)
      end
      it "redirect to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
