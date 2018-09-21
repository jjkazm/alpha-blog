class CategoriesController < ApplicationController
  before_action :category_params, only: [:create, :edit, :update, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category added"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
