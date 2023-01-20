class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode payload, ENV.fetch("secret"), 'HS256'
  end

  def decode_token
    token = request.headers["Authorization"] 
    begin
      JWT.decode token, ENV.fetch("secret"), true, { algorithm: 'HS256' }
    rescue => exception
      exception.message
    end
  end

  def auth_user
    decoded_token = decode_token
    if decoded_token
      user_id = decoded_token.first['data']
      @user = User.find_by(id: user_id)
    end
  end

  def authenticated
    render json: { message: 'You must be logged in.' }, status: :unauthorized unless auth_user
  end
end
