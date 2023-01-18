class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV.fetch("secret"))
  end
end
