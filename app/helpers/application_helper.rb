require 'active_support/core_ext'

module ApplicationHelper
#CR just define a current user method and access it's name when needed
# also, this is already in Athentication Helper.

  def current_user_name
    user = current_user
    user.username
  end

  def datetime_to_date(datetime)
    datetime.to_date
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end

module AuthenticateHelper
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    end
    #CR optimize this as @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_name
    user = current_user
    user.username
  end
end
