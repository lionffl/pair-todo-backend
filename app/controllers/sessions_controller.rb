class SessionsController < ApplicationController
  def create
    user = User.find_by("username = ?", user_params[:username])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: { username: user.username },
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