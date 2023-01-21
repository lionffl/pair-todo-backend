class RegistrationsController < ApplicationController  
  def create
    begin
      user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => e
      messages = e.record.errors.full_messages
    end
  
    if user && user.save
      session[:user_id] = user.id
      render json: { success: true, id: user.id, username: user.username }, 
      status: :created
    else
      render json: { messages: messages }
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
