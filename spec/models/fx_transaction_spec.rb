require 'rails_helper'

RSpec.describe FxTransaction, type: :model do

  before(:all) do
    @fx_transaction = FxTransaction.create(customer_id: 1232, input_amount: 100.00, input_currency: "USD", output_amount: 12000, output_currency: "KSH", transaction_date: "01/03/2022")
  end

  # check that @fx_transaction is a valid instance of FxTransaction class, validates all params as well
    it "checks that a fx_transaction can be created" do
      expect(@fx_transaction).to be_valid
    end

    it "checks that a transaction can be found by id" do
      expect(FxTransaction.find(@fx_transaction.id)).to eq(@fx_transaction)
    end

    it "text" do

    end


end
