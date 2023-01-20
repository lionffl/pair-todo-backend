class LoginController < ApplicationController
  def create
    user = User.find_by!("username = ?", user_params[:username])

    if user && user.authenticate(user_params[:password])
      token = encode_token({ data: user.id })
      render json: { token: token },
      status: :ok
    else
      render json: { message: 'Wrong password or username. Login failed' }, 
      status: :unauthorized
    end
  end
  
  private
  
  def user_params
    params.required(:user).permit(:username, :password)
  end
end