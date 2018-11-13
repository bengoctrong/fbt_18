class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper

  def multiplication a, b
    a * b
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "not_logged"
    redirect_to login_path
  end

  def is_admin?
    return if logged_in? && current_user.admin?
    flash[:danger] = t "not_allow"
    redirect_to root_path
  end
end
