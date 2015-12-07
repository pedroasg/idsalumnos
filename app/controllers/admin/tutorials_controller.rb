class Admin::TutorialsController < ApplicationController
  respond_to :html
  before_action :is_admin

  def index
    @tutorials = Tutorial.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(permited_params)
    if @tutorial.save
      flash[:notice] = "Noticia creada."
      redirect_to admin_tutorials_path
    else
      respond_with @tutorial
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update(permited_params)
      flash[:notice] = "Noticia actualizada"
      redirect_to admin_tutorials_path
    else
      respond_with @tutorial
    end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
    redirect_to admin_tutorial_path
  end

  private
  def permited_params
    params.require(:tutorial).permit(:name, :url, :description, :language)
  end
end
