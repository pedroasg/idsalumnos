class CoursesController < ApplicationController
  def index
    @courses = Course.where(status: "Inscripciones abiertas")
  end

  def show
    @course = Course.find(params[:id])
  end
end
