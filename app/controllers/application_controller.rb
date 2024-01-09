class ApplicationController < ActionController::Base
  before_action :authorize_request
  skip_before_action :authorize_request, only: [:root]
  def root
    render json: { welcome_message: 'Gear up, motorcycle enthusiasts! You have just stumbled upon the ultimate Motorcycle Booking API 🏁🏍️🛵🏍🚴' }, status: :ok
  end

  def current_user
    session[:current_user]
  end

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { error: true, message: 'You do not have the authorization!😁' }, status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { error: true, message: 'OOps! Could not find element with the provided Id' }, status: :not_found
  end

  private

  def authorize_request
    # if request.headers['Authorization']
      header = request.headers['Authorization']
      header = header.split.last if header
    # else
      # if session[:current_user].token
        # header = session[:current_user].token
      # end
    # end

    begin
      @decoded = JWT.decode(header, Rails.application.secret_key_base)[0]
      @current_user = User.find(@decoded['id'])
      session[:current_user] = @current_user
    rescue JWT::DecodeError
      render json: { error: true, message: 'OOps! you are not unauthorized 😁😁!' }, status: :unauthorized
    end
  end  
  def destroy_pending_user_state
    reset_session
  end
end
