class UsersController < ApplicationController
  before_action :authenticated, only: [:index]
  
  def create
    begin
      user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => e
      messages = e.record.errors.full_messages
    end
  
    if user && user.save
      token = encode_token({ data: user.id })
      render json: { username: user.username, token: token }, 
      status: :created
    else
      render json: { messages: messages }, 
      status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users
  end

  private
  
  def user_params
    params.required(:user).permit(:username, :password, :password_confirmation, :secret_question, :secret_answer)
  end
end
