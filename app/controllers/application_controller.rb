class ApplicationController < ActionController::Base
  attr_reader :current_user

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def decode_token(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base)
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = decode_token(header)
      @current_user = User.find(@decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def logged_in?
    !!current_user
  end

  def require_login
    render json: { message: 'Please Login' }, status: :unauthorized unless logged_in?
  end
end
