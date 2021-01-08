class CategoriesController < ApplicationController
  before_action :authenticate_admin!, except: %i[show]
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path, notice: 'Categoria cadastrada com sucesso.'
    else
      flash.now[:alert] = @category.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @category.update category_params
      redirect_to categories_path, notice: 'Categoria atualizada com sucesso.'
    else
      flash.now[:alert] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    redirect_to categories_path, notice: 'Categoria removida com sucesso.' if @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
