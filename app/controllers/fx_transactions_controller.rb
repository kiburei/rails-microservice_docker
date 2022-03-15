class FxTransactionsController < ApplicationController
  before_action :set_fx_transaction, only: [:show]

  def create
    transaction = FxTransaction.new(fx_transactions_params)
    # confirm if currency is valid
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
    render json: transactions, status: :ok
  end

  def show
    render json: @transaction
  end

  private

  def fx_transactions_params
    params.require(:fx_transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date)
  end

  def set_fx_transaction
    @transaction = FxTransaction.find(params[:id])
  end

end
