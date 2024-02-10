class Earning < ApplicationRecord
  belongs_to :wallet

  enum status: { unapplied: 0, applied: 1 }
  enum kind: { salary: 0, leftover: 1, profitability: 2 }

  before_create :check_status_change!
  before_update :check_status_change!

  private

  def check_status_change!
    return unless status_changed?

    wallet.update(balance: wallet.balance + value) if applied?
  end
end
