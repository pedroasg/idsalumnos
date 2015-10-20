class Admin::LayoutController < ApplicationController
  before_action :is_admin, except: :search

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
end
