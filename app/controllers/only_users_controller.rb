class OnlyUsersController < ApplicationController
  def create
    user = User.create!(permitted_params)

    Wallet.create!(user_id: user.id, balance: 0, status: :non_balance) if user.present? && user.wallet.blank?

    render json: { message: 'usuario criado com sucesso', user: user }, status: :created
  end

  def update
    user = User.find(params[:id])
    user.update!(permitted_params)

    Wallet.create!(user_id: user.id, balance: 0, status: :non_balance) if user.present? && user.wallet.blank?

    render json: { message: 'usuario criado com sucesso', user: user }, status: :created
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :name)
  end
end
