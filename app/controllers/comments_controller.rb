class CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_comment, only: %i[destroy]
  before_action :set_book, only: %i[create destroy]

  def create
    @comment = @book.comments.new comment_params
    @comment.member = current_member
    respond_to do |format|
      if @comment.valid? && @comment.save
        format.js { flash.now[:notice] = 'Comentário adicionado com sucesso.' }
      else
        format.js { flash.now[:alert] = @comment.errors.full_messages }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.member == current_member
        if @comment.destroy
          format.js { flash.now[:notice] = 'Comentário removido com sucesso.' }
        else
          format.js { flash.now[:alert] = @comment.errors.full_messages }
        end
      else
        format.js { flash.now[:alert] = 'Você não pode apagar este comentário.' }
      end
    end
  end

  private

  def set_comment
    @comment = current_member.comments.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
