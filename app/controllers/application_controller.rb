class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper

  def multiplication a, b
    a * b
  end

  def check_admin
    return if logged_in? && current_user.admin?
    flash[:danger] = t "not_allow"
    redirect_to root_path
  end
end
