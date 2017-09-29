class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_cart

  def logged_in?
    !!current_user
  end

  def verify_user
    redirect_to new_user_registration_path unless logged_in?
  end

  def current_cart
    current_user.current_cart if current_user
  end

end
