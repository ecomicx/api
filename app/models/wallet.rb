class Wallet < ApplicationRecord
  belongs_to :user

  enum status: { non_balance: 0, positive: 1, negative: 2 }

  before_update :check_balance

  def check_balance
    return unless balance_changed?
    return positive! if balance.positive?
    return non_balance! if balance.zero?

    negative!
  end
end
