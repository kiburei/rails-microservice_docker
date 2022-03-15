require "test_helper"

class FxTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fx_transactions_index_url
    assert_response :success
  end

  test "should get create" do
    get fx_transactions_create_url
    assert_response :success
  end

  test "should get show" do
    get fx_transactions_show_url
    assert_response :success
  end
end
