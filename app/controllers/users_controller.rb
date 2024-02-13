class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[login create]

  def create
    user = User.create!(permitted_params)

    Wallet.create!(user_id: user.id, balance: 0, status: :non_balance) if user.present? && user.wallet.blank?

    token = encode_token({ user_id: user.id })

    render json: { message: 'usuario criado com sucesso', user: user.presence, token: token.presence }, status: :created
  end

  def update
    user = User.find(params[:id])
    user.update!(permitted_params)

    render json: { message: 'usuario criado com sucesso', user: user.presence }, status: :created
  end

  def login
    user = User.find_by!(email: permitted_params[:email])

    return raise_autehntication_error unless user.authenticate(permitted_params[:password])

    token = encode_token({ user_id: user.id })

    render json: { message: 'usuario logado com sucesso', user: user.presence, token: token.presence }, status: :ok
  end

  private

  def raise_autehntication_error
    render json: { message: 'Credenciais incorretas' }, status: :unauthorized
  end

  def permitted_params
    params.require(:user).permit(:email, :password, :name)
  end
end
