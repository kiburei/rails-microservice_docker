class CreateFxTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :fx_transactions do |t|
      t.integer :customer_id
      t.decimal :input_amount
      t.string :input_currency
      t.decimal :output_amount
      t.string :output_currency
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
