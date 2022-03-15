class FxTransactionsController < ApplicationController
  before_action :set_fx_transaction, only: [:show]

  def index
    transactions = FxTransaction.all
    render json: transactions
  end

  def create
    transaction = FxTransaction.new(fx_transactions_params)
    if transaction.save!
      render json: transaction
    end
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
