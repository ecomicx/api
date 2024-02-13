class WalletsController < ApplicationController
  before_action :authorize_request!

  def index
    render json: current_user.wallet, status: :ok
  end
end
