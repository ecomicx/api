class HomeController < ApplicationController
  def index
    render json: { message: 'up' }, status: :ok
  end
end
