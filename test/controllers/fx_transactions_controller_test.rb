require "test_helper"

class FxTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/transactions'
    assert_response :success
  end

  test "should get create" do
    post fx_transactions_create_url
    assert_response :success
  end

  test "should get show" do
    get 'transactions/301500001'
    assert_response :success
  end
end
