class UsersController < ApplicationController
  def create
    begin
      user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => e
      messages = e.record.errors.full_messages
    end
  
    if user && user.save
      token = encode_token({user_id: user.id})
      render json: { username: user.username, token: token }, 
      status: :created
    else
      render json: { errors: messages }, 
      status: :unprocessable_entity
    end
  end

  def signin
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

  def index
    users = User.all
    render json: users
  end

  private
  
  def user_params
    params.permit(:username, :password, :password_confirmation, :secret_question, :secret_answer)
  end
end
