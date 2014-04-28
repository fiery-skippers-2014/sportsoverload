require 'active_support/core_ext'

module ApplicationHelper

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
  end

  def current_user_name
    user = current_user
    user.username
  end
end
