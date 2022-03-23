require "http"
require "bunny"
class DashboardService

  # update from queue using seakers
  def get_fx_transactions_all
    FxTransaction.all
  end

  def get_fx_transaction(transaction_id)
    FxTransaction.find(transaction_id)
  end

  private

# use docker container name
  def bkd_fx_transactions_url
    "http://fx_transactions_microservice-web-1:3000"
  end

end
