class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin
  include SessionsHelper

  def current_admin
    current_user.admin
  end

  def is_admin
    if  current_user.nil? || !current_admin
      flash[:error] = "No haz iniciado sesión o no eres administrador."
      redirect_to root_path
    end
  end

end
