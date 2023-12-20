class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index; end

  def show; end

  def create
    reservation=Reservation.new(reservation_params)
    reservation.user=current_user
    if (reservation.save)
       render json: { success: true, message: 'Created Successfully!' }
     elsif
       render json: { error: true, message: 'Ups! Could not Create the new Reservation' }
     end
  end

  def destroy; end

  private

   def reservation_params
     params.require(:reservation).permit(:duration, :total, :motorcycle_id, :date, :city)
    end
end
