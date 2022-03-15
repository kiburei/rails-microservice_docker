class FxTransaction < ApplicationRecord
  validates :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date, presence: true
end
