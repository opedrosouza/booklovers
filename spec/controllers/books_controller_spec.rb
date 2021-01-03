require "rails_helper"

RSpec.describe BooksController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the 'index' template" do
      get :index
      expect(response).to render_template("index")
    end
    it 'test the ransack search' do
      10.times.each do |i|
        create(:book, title: "Testing Book #{i}")
      end
      get :index, params: { search: { title_or_description_or_author_name_cont: '2' }}
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "has a 200 status code" do
      book = create(:book)
      get :show, params: { id: book.id }
      expect(response.status).to eq(200)
    end
    it "renders the 'show' template" do
      book = create(:book)
      get :show, params: { id: book.id }
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
    it "has a 200 status code" do
      book = create(:book)
      get :edit, params: { id: book.id }
      expect(response.status).to eq(200)
    end
    it "renders the 'edit' template" do
      book = create(:book)
      get :edit, params: { id: book.id }
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    it "Redirect Success" do
      post :create, params: { book: { title: Faker::Book.name, description: Faker::Books::Lovecraft.paragraph, author_name: Faker::Book.author } }
      expect(response).to redirect_to(books_path)
    end

    it "Render :new on failure" do
      post :create, params: { book: { title: '', description: Faker::Books::Lovecraft.paragraph, author_name: Faker::Book.author } }
      expect(response).to render_template("new")
    end
  end

  describe "PATCH update" do
    it "Redirect success" do
      book = create(:book)
      patch :update, params: { id: book.id, book: { title: Faker::Book.name, description: Faker::Books::Lovecraft.paragraph, author_name: Faker::Book.author } }
      expect(response).to redirect_to(book_path(book.id))
    end

    it "Render edit on failure" do
      book = create(:book)
      patch :update, params: { id: book.id, book: { title: '', description: Faker::Books::Lovecraft.paragraph, author_name: Faker::Book.author } }
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE destroy" do
    it "Redirect success" do
      book = create(:book)
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to(books_path)
    end
  end
end
