class Api::V1::MotorcyclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]
  load_and_authorize_resource
  before_action :set_motorcycle, only: %i[show destroy]
  def index
    @motorcycles = Motorcycle.all
    authorize! :read, @motorcycles
    if @motorcycles.size.positive?
      render json: { success: true, data: @motorcycles }, status: :ok
    else
      render json: { success: true, message: 'Ups! there is not Motorcycle for while!😁' }, status: :ok
    end
  end

  def show
    return unless Motorcycle.exists?(params[:id])

    @motorcycle = Motorcycle.find(params[:id])
    authorize! :read, @motorcycle
    render json: { success: true, motorcycle: @motorcycle }, status: :ok
  end

  def create
    motorcycle = Motorcycle.new(motorcycle_params)
    authorize! :create, @motorcycle
    if motorcycle.save
      render json: { success: true, message: 'Created Successfully!😁' }, status: :created
    else
      render json: { error: true, message: motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @motorcycle = Motorcycle.find_by(id: params[:id])
  
    if @motorcycle
      if @motorcycle.booked_for_reservation?
        render json: { error: true, message: 'Motorcycle is booked for a reservation, cannot be deleted.' }, status: :unprocessable_entity
      else
        if @motorcycle.destroy
          authorize! :destroy, @motorcycle
          render json: { success: true, message: 'Removed Successfully!😁' }, status: :ok
        else
          render json: { error: true, message: 'Failed to remove the motorcycle.' }, status: :internal_server_error
        end
      end
    else
      render json: { error: true, message: 'Motorcycle with the provided Id does not exist.' }, status: :not_found
    end
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :color, :chassisNumber, :bookingPricePerHour, :brand, :model, :price, :imageLink, :description)
  end
end
