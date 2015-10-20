class Admin::LayoutController < ApplicationController
  before_action :is_admin

  def index
    params[:search] = "" if params[:search].nil?
    unless params[:search].empty?
      @users = User.where("first_name like ? or last_name like ?",
        '%'+ params[:search] + '%',
        '%' + params[:search] + '%').paginate(:page => params[:page],
                                                      :per_page => 10)
      if @users.count < 1
        flash.now[:danger] = 'Nothing found'
        @users = User.all.paginate(:page => params[:page],
                                             :per_page => 10)
      end
    else
      @users = User.all.paginate(:page => params[:page],
                                             :per_page => 10)
    end
    @users
  end

  def search
    unless params[:search].empty?
    @users = User.where("first_name like ? or last_name like ?",
        '%'+ params[:search] + '%',
        '%' + params[:search] + '%').limit(5)
    end
    respond_to do |format|
      format.js {render layout: true}
    end
  end

  private
  def provider_params
    params.require(:user).permit(:first_name, :last_name, :admin)
  end
end
