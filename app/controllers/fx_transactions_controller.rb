class FxTransactionsController < ApplicationController

  def create
    transaction = FxTransaction.new(fx_transactions_params)

    transaction.id = FxTransaction.transaction_id
    # confirm if currency is valid from another service or api
    if transaction.save!
      # publish new fx_transaction to dash after create
      FxTransactionsService.new(transaction.id).publish
      response = {
        status: 201,
        message: "Created",
        data: transaction
      }
    end
    render json: response, status: :created

    rescue StandardError => e
      error = {
        status: 400,
        error: "Something went wrong",
        message: e
      }
    render json: error
  end

  def index
    service = DashboardService.new
    fx_transactions = service.get_fx_transactions_all
    # can add summary of transactions
    response = {
      status: 200,
      message: "Success",
      data: fx_transactions
    }
    render json: response

  rescue StandardError => e
    error = {
      status: 400,
      error: "Something went wrong",
      message: e
    }
  render json: error
  end

  def show
    service = DashboardService.new
    fx_transaction = service.get_fx_transaction(params[:id])

    response = {
      status: 200,
      message: "Success",
      data: fx_transaction
    }
    render json: response, status: :ok
  end

  private

  def fx_transactions_params
    params.require(:fx_transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date)
  end

  # def set_fx_transaction
  #   @transaction = FxTransaction.find(params[:id])
  # rescue StandardError => e
  #   error = {
  #     status: 404,
  #     error: "Transaction not Found",
  #     message: e
  #   }
  # render json: error
  # end

end
