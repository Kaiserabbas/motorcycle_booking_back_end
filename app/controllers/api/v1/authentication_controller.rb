class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:login]
  skip_before_action :verify_authenticity_token, only: [:login]

  def login  
      user = User.find_by(email: params[:user][:email])
      if user&.authenticate(params[:user][:password])
        validate_token(user.token)
        render json: { success: true, message: 'Login Successfully😁😁' }, status: :ok
      else
        render json: {error:true, message: "Ups! could not login! Check your  Email or Password!😁"}, status: :forbidden
      end
  end

  private

  def validate_token(token)
    begin
      @decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      @current_user = User.find(@decoded['id'])
      session[:current_user] = @current_user
    rescue JWT::DecodeError
      render json: { error: true, message: 'Ups! you are not unauthorized 😁😁!' }, status: :unauthorized
    end
  end
end
