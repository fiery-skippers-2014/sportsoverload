class ApplicationController < ActionController::Base
  protect_from_forgery
  helper AuthenticateHelper
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    end
  end
end
