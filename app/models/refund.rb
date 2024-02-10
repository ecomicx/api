class Refund < ApplicationRecord
  belongs_to :wallet
  belongs_to :refund_origin, class_name: 'Refund', optional: true

  enum status: { non_paid: 0, paid: 1, cancel: 2 }
  enum kind: { recurrent: 0, unrecurrent: 1 }
end
