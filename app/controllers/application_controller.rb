class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    user_id = session[:user_id]
    user_id ||= 0
    @current_user ||= User.find(user_id)
  end

  helper_method :current_user
end
