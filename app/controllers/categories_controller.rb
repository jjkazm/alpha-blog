class CategoriesController < ApplicationController
  before_action :require_admin, except: [:show, :index]
  before_action :set_category, only: [:edit, :update, :show, :destroy]

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

  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page:3)
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was succesfullly added"
      redirect_to category_path(@category)
    else
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category was succesfully deleted"
    redirect_to categories_path

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || !current_user.admin
      flash[:danger] = "Only admin can do that"
      redirect_to categories_path
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
