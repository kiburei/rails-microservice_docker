class DashboardService
  require "http"

  def get_fx_transactions_all
    JSON.parse(HTTP.get("#{bkd_fx_transactions_url}/transactions").body)
  end

  def get_fx_transaction(transaction_id)
    JSON.parse(HTTP.get("#{bkd_fx_transactions_url}/transactions/#{transaction_id}").body)
  end

  private

# use docker container name
  def bkd_fx_transactions_url
    "http://fx_transactions_microservice-web-1:3000"
  end

end
