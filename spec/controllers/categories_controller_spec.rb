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

    describe "GET show" do
      before(:each) do
        @category = create(:category)
      end
      it "has a 200 status code" do
        get :show, params: { id: @category.id }
        expect(response.status).to eq(200)
      end
      it "renders the 'show' template" do
        get :show, params: { id: @category.id }
        expect(response).to render_template("show")
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

    describe "GET edit" do
      before(:each) do
        @category = create(:category)
      end
      it "has a 200 status code" do
        get :edit, params: { id: @category.id }
        expect(response.status).to eq(200)
      end
      it "renders the 'edit' template" do
        get :edit, params: { id: @category.id }
        expect(response).to render_template("edit")
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

    describe "PATCH update" do
      before(:each) do
        @category = create(:category)
      end
      it "Redirect Success" do
        patch :update, params: { id: @category.id, category: { title: 'Category test edit', description: 'Category test desc' } }
        expect(response).to redirect_to(categories_path)
      end
      it "Render :edit on failure" do
        patch :update, params: { id: @category.id, category: { title: '', description: 'Category test desc' } }
        expect(response).to render_template("edit")
      end
    end

    describe "DELETE destroy" do
      before(:each) do
        @category = create(:category)
      end
      it "Redirect success" do
        category = create(:category)
        delete :destroy, params: { id: category.id }
        expect(response).to redirect_to(categories_path)
      end
    end
  end
  
  context 'As guest user' do
    describe "GET show" do
      before(:each) do
        @category = create(:category)
      end
      it "has a 200 status code" do
        get :show, params: { id: @category.id }
        expect(response.status).to eq(200)
      end
      it "renders the 'show' template" do
        get :show, params: { id: @category.id }
        expect(response).to render_template("show")
      end
    end
  end
end
