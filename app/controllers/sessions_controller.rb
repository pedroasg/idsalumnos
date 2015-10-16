class SessionsController < ApplicationController
  before_action :already_logged, only: [:new, :create]

  def new
  end

  def create
    if params[:provider].present?
      auth = request.env["omniauth.auth"]
      user = User.find_by_facebook_id(auth["uid"]) ||
        User.new
      user.update_facebook_info(auth)
      session[:user_id] = user.id
      flash[:notice] = "Haz iniciado sesión exitosamente"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Sesión terminada exitosamente."
    redirect_to root_path
  end
end
