class MotorcyclesController < ApplicationController
  def index
    @motorcycle=Motorcycle.first
  end

  def show; end

  def create; end

  def destroy
    if Motorcycle.exists?(params[:id])
      Motorcycle.destroy(params[:id])
      render json:{success:true,message:"Removed Successfully!"}
    elsif
      render json:{error:true,message:"Ups! could not find motorcycle with this id #{params[:id]}"}
    end
  end
end
