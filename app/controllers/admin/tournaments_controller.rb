class Admin::TournamentsController < ApplicationController
  respond_to :html
  before_action :is_admin

  def index
    @tournaments = Tournament.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @tournament = Tournament.new
    tournament_status
  end

  def create
    @tournament = Tournament.new(permited_params)
    if @tournament.save
      flash[:notice] = "Torneo creado."
      redirect_to admin_tournaments_path
    else
      respond_with @tournament
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
    @teams = @tournament.teams.order(:name)
    tournament_status
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(permited_params)
      flash[:notice] = "Torneo actualizado."
      redirect_to admin_tournaments_path
    else
      respond_with @tournament
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to admin_tournaments_path
  end

  private
  def permited_params
    params.require(:tournament).permit(:name, :winner, :image, :status)
  end
  def tournament_status
    @tournament_status = [ "Inscripciones abiertas", "Inscripciones cerradas",
      "Finalizado" ]
  end
end
