class BookOfUsersController < ApplicationController
  before_action :render_unauthorized
  before_action :authenticate_user!

  def create
    @book = Book.find book_of_user_params[:book_id]

    respond_to do |format|
      if current_book = current_user.book_of_users.where(book_id: @book.id).first
        if current_book.update(status: book_of_user_params[:status])
          format.js { flash.now[:notice] = 'Livro atualizado com sucesso na sua colecão.' }
        else
          format.js { flash.now[:notice] = current_book.errors.full_messages }
        end
      else
        book_of_user = BookOfUser.new book_of_user_params
        book_of_user.book = @book
        book_of_user.user = current_user

        if book_of_user.save
          format.js { flash.now[:notice] = 'Livro adicionado com sucesso a sua colecão.' }
        else
          format.js { flash.now[:alert] = book_of_user.errors.full_messages }
        end
      end
    end
  end

  private

  def render_unauthorized
    current_user.nil? ? redirect_to(request.referrer, alert: 'Você precisa fazer login.') : true
  end

  def book_of_user_params
    params.require(:book_of_user).permit(:status, :book_id)
  end
end
