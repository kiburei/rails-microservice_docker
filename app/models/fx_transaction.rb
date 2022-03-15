class FxTransaction < ApplicationRecord
  validates :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date, presence: true
  # ensure FxTransaction.last returns the last record in the db other than by id
  default_scope { order(created_at: :asc) }
end
