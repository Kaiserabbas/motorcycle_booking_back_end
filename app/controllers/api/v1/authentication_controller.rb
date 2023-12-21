class Api::V1::AuthenticationController < ApplicationController
  def login
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      token = user.generate_jwt
      render json: { token: }
      session[:current_user]=user
      puts "Ola Eu sou o #{session[:current_user].name}"
    else
      head :unauthorized
    end
  end
end
