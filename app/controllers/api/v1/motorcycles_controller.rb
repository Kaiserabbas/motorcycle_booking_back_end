class Api::V1::MotorcyclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]
  load_and_authorize_resource

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
    return unless Motorcycle.exists?(params[:id])

    @motorcycle = Motorcycle.destroy(params[:id])
    authorize! :destroy, @motorcycle
    render json: { success: true, message: 'Removed Successfully!😁' }, status: :ok
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :color, :chassisNumber, :bookingPricePerHour, :brand, :model, :price, :imageLink, :description)
  end
end
