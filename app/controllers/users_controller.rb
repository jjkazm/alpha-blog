class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was succesfully created"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end
