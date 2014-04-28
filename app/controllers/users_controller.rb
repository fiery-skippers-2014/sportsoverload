class UsersController < ApplicationController
  def show
      #CR what is the point of user_object?  Is your goal to only
      # show info for logged in user? Or only show this user if there is a
      # logged in user?
  user_object = current_user
  if user_object && user_object.id == session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save!
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

end
