class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]
  load_and_authorize_resource

  def index
    @current_user=  User.find(session[:current_user].id)
    @reservations = @current_user.reservations
    if @reservations.size.positive?
      authorize! :read, @reservations
      render json: { success: true, data: @reservations }, status: :ok
    else
      render json: { success: true, message: 'Ups! there is not Reservation for while!😁' }, status: :ok
    end
  end

  def show
    return unless Reservation.exists?(params[:id])

    @reservation = Reservation.find(params[:id])
    authorize! :read, @reservation
    render json: { success: true, reservation: @reservation }, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user = session[:current_user]
    authorize! :create, reservation
    if reservation.save
      render json: { success: true, message: 'Created Successfully!😁' }, status: :created
    else
      render json: { error: true, message: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if Reservation.exists?(params[:id])
      @reservation = Reservation.destroy(params[:id])
      authorize! :destroy, @reservation
      render json: { success: true, message: 'Removed Successfully!😁' }, status: :ok
    else
      render json: { error: true, message: 'Could not remove the reservation!, Please(🙏), ensure a valid ID' },
             status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:duration, :total, :motorcycle_id, :date, :city)
  end
end
