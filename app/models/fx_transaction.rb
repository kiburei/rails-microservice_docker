class FxTransaction < ApplicationRecord
  validates :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date, presence: true
  # ensure FxTransaction.last returns the last record in the db other than by id
  default_scope { order(created_at: :asc) }

  def self.transaction_id
    # create unique transction ids that suit organisation i.e {MM/DD/HH/AutoInc/CurrencyID}
    # create 8 digit id
    Date.today.month.size > 1  ? month = Date.today.month.to_s + "0" : month = Date.today.month.to_s # 2 char
    Time.now.hour.size > 1 ? time = Time.now.hour.to_s + "0" : time = Time.now.hour.to_s # 2 char
    if FxTransaction.any?
      last_rec = FxTransaction.last.id.to_s.split('').pop(4).join().to_i
      last_rec.to_s == 4 ? increment = (last_rec += 1).to_s : increment = (last_rec += 1).to_s.rjust(4, '0') # 4 char
    else
      increment = "0001"
    end
    transaction_id = month + time + increment
    return transaction_id
  end


end
