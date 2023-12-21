class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @reservations = Reservation.all
    if @reservations.size>0
    render json: { success: true, data: @reservations }, status: :ok
    else
      render json: { message: 'Ups! there is not Reservation!' }, status: :no_content
    end
  end

  def show
    if Reservation.exists?(params[:id])
      render json: { success: true, reservation: Reservation.find(params[:id]) }, status: :ok
    else
      render json: { error: true, message: 'Ups! there is not Reservation with the provided Id' }, status: :not_found
    end
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: { success: true, message: 'Created Successfully!' }, status: :created
    else
      render json: { error: true, message: 'Ups! Could not Create the new Reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    if Reservation.exists?(params[:id])
      Reservation.destroy(params[:id])
      render json: { success: true, message: 'Removed Successfully!' }, status: :ok
    else
      render json: { error: true, message: 'Could not remove the reservation!' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:duration, :total, :motorcycle_id, :date, :city, :user_id)
  end
end
