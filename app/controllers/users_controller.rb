class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def sign_up
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save!
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render sign_up_path
    end
  end
end