class Congreso::RegistrosController < ApplicationController
  respond_to :html
  helper_method :campus_list, :carreras_list

  def campus_list
    ["Chihuahua", "Cumbres", "Durango", "Guadalupe", "Laguna",
      "Las Torres", "Matamoros", "Nvo. Laredo" , "Reynosa", "San Nicolás"]
  end
  def carreras_list
    ["Desarrollo de Software", "Industrial", "Mecatrónica",
      "Sistemas de Computación Administrativa", "Administrativo", "Maestro",
      "Otro"]
  end

  def new
    @registro =  Registro.new
  end

  def create
    @registo = Registo.new(permited_params)
    if @registo.save
      flash[:notice] = "Gracias por su registro."
      redirect_to congreso_root_path
    else
      respond_with @registo
    end
  end

  private
  def permited_params
    params.require(:registo).permit(:nombres, :apellidos, :email, :matricula,
      :campus, :carrera)
  end
end
