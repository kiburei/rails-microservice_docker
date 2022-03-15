require 'rails_helper'

RSpec.describe FxTransaction, type: :model do

  describe "create" do
    context "post an fx trnasaction to the db" do
      it "validates all required params are present" do
        expect { FxTransaction.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  

end
