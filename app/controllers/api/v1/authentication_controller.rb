class AuthenticationController < ApplicationController
   def login
      user = User.find_by(name: params[:name])
      if user&.authenticate(params[:password])
        token = user.generate_jwt
        render json: { token: token }
      else
        head :unauthorized
      end
   end
end
