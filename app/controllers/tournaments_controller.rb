class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def watch
  end
end
