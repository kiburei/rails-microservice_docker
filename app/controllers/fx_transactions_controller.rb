class FxTransactionsController < ApplicationController
  before_action :set_fx_transaction, only: [:show]

  def create
    transaction = FxTransaction.new(fx_transactions_params)

    transaction.id = FxTransaction.transaction_id
    # confirm if currency is valid from another service or api
    if transaction.save!
      response = {
        status: 200,
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
    transactions = FxTransaction.all
    # can add summary of transactions
    response = {
      status: 200,
      message: "Success",
      data: transactions
    }
    render json: response, status: :ok

  rescue StandardError => e
    error = {
      status: 400,
      error: "Something went wrong",
      message: e
    }
  render json: error
  end

  def show
    response = {
      status: 200,
      message: "Success",
      data: @transaction
    }
    render json: response, status: :ok
  end

  private

  def fx_transactions_params
    params.require(:fx_transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date)
  end

  def set_fx_transaction
    @transaction = FxTransaction.find(params[:id])
  rescue StandardError => e
    error = {
      status: 404,
      error: "Transaction not Found",
      message: e
    }
  render json: error
  end

end
