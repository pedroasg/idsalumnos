class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider].present?
      auth = request.env["omniauth.auth"]
      user = User.find_by_facebook_id(auth["uid"]) ||
        User.new
      user.update_facebook_info(auth)
      session[:user_id] = user.id
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
