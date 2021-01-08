require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  context 'As authenticated admin' do
    login_admin
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

    describe "GET new" do
      it "has a 200 status code" do
        get :new
        expect(response.status).to eq(200)
      end
      it "renders the 'new' template" do
        get :new
        expect(response).to render_template("new")
      end
    end

    describe "POST create" do
      it "Redirect Success" do
        post :create, params: { category: { title: 'Category test', description: 'Category test desc' } }
        expect(response).to redirect_to(categories_path)
      end
      it "Render :new on failure" do
        post :create, params: { category: { title: '', description: 'Category test desc' } }
        expect(response).to render_template("new")
      end
    end
  end
end
