class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV.fetch("secret"))
  end

  def decode_token
    auth = request.headers["Authorization"]
    if auth
      token = auth.split(' ')[1]
      begin
        JWT.decode(token, ENV.fetch("secret"), true, 'HS256')
      rescue => exception
        exception.message
      end
    end
  end
end
