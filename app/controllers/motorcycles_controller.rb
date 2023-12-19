class MotorcyclesController < ApplicationController
  def index
    @motorcycle = Motorcycle.all
  end

  def show; end

  def create; end

  def destroy
    return unless Motorcycle.exists?(params[:id])

    Motorcycle.destroy(params[:id])
    render json: { success: true, message: 'Removed Successfully!' }
  end
end
