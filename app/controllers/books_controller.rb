class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: %i[index show]

  def index
    @books_query = Book.ransack(params[:search])
    @books = @books_query.result(distinct: true)
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to books_path, notice: 'Livro cadastrado com sucesso.'
    else
      render :new, alert: @book.errors.full_messages
    end
  end

  def edit; end

  def update
    if @book.update book_params
      redirect_to book_path(@book), notice: 'Livro atualizado com sucesso.'
    else
      render :edit, alert: @book.errors.full_messages
    end
  end

  def destroy
    redirect_to books_path, notice: 'Livro removido com sucesso.' if @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_name, :cover)
  end
end
