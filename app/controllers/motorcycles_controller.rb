class MotorcyclesController < ApplicationController
  def index
    @motorcycle=Motorcycle.first
  end

  def show; end

  def create; end

  def destroy
    if Motorcycle.destroy(params[:id])
       return render json:{success:true,message:"Removed Successfully!"}
    end
    return render json:{error:true,message:"Ups! Could not Remove the Motorcycle!"}
  end
end