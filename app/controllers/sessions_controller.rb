class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by("username = ?", user_params[:username])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: { login: true, username: user.username },
      status: :ok
    else
      render json: { message: 'Wrong password or username. Login failed' }
    end
  end

  def logged_in
    if @current_user
      render json: { login: true, username: @current_user.username }
    else
      render json: { login: false, message: 'User not logged in' }
    end
  end

  def destroy
    reset_session
    render json: { login: false, message: 'User logged out' }
  end
  
  private
  
  def user_params
    params.required(:user).permit(:username, :password)
  end
end