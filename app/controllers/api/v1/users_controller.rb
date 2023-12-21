class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts params[:user]
    @user = User.new(user_params)

    if @user.save
      token = @user.generate_jwt
      render json: { token: token }, status: :created
    else
      render json: { error:true, message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

   def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
