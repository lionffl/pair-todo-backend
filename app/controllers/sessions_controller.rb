class SessionsController < ApplicationController
  def create
    user = User.find_by!(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      token = encode_token({user_id: user.id})
      render json: { username: user.username, token: token }, 
      status: :ok
    else
      render json: { error: 'Wrong password or username. Login failed' }, 
      status: :unauthorized
    end
  end

  def destroy
    
  end
end