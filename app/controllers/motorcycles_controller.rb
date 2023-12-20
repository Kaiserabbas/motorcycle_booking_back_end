class MotorcyclesController < ApplicationController
  def index
    @motorcycle = Motorcycle.all
    render json: { success: true, data: @motorcycle }
  end

  def show; end

  def create; end

  def destroy
    return unless Motorcycle.exists?(params[:id])

    Motorcycle.destroy(params[:id])
    render json: { success: true, message: 'Removed Successfully!' }
  end
end
