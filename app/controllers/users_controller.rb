class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page], per_page: 5).order(articles_count: :desc)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User #{@user.username} was succesfully created"
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your data was succesfully updated"
      # redirect_to user_path(@user)
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page:5).order(updated_at: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "you can only edit your own account"
    end
  end
end
