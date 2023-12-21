class Api::V1::MotorcyclesController < ApplicationController
  def index
    @motorcycles = Motorcycle.all
    if @motorcycles.size>0
    render json: { success: true, data: @motorcycles }, status: :ok
    else
      render json: { message: 'Ups! there is not Reservation!' }, status: :no_content
    end
  end

  def show
    if Motorcycle.exists?(params[:id])
      render json: { success: true, motorcycle: Motorcycle.find(params[:id]) }, status: :ok
    else
      render json: { error: true, message: 'Ups! there is not Motorcycle with the provided Id' }, status: :not_found
    end
  end

  def create
    motorcycle = Motorcycle.new(motorcycle_params)
    motorcycle.user = current_user
    if motorcycle.save
      render json: { success: true, message: 'Created Successfully!' }, status: :created
    else
      render json: { error: true, message: 'Ups! Could not Create the new Motorcycle' }, status: :unprocessable_entity
    end
  end

  def destroy
    if Motorcycle.exists?(params[:id])
      Motorcycle.destroy(params[:id])
      render json: { success: true, message: 'Removed Successfully!' }, status: :ok
    else
      render json: { error: true, message: 'Could not remove the Motorcycle!' }, status: :unprocessable_entity
    end
  end
end
