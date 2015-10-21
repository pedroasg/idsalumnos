class Admin::CoursesController < ApplicationController
  respond_to :html
  before_action :is_admin

  def index
    @courses = Course.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(permited_params)
    if @course.save
      flash[:notice] = "Noticia creada."
      redirect_to admin_courses_path
    else
      respond_with @course
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(permited_params)
      flash[:notice] = "Noticia actualizada"
      redirect_to admin_courses_path
    else
      respond_with @course
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path
  end

  private
  def permited_params
    params.require(:course).permit(:name, :description, :image)
  end
end
