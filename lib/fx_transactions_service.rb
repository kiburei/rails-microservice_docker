require "bunny"

class FxTransactionsService
  attr_reader :fx_transaction

  def initialize(fx_transaction_id)
    @fx_transaction = FxTransaction.find_by id: fx_transaction_id
  end

  def publish
    return if fx_transaction.nil?
    exchange = channel.direct("fx_transactions_create")
    exchange.publish(payload, routing_key: queue.name, persistent: true)
    connection.close
  end

  private

  def payload
    fx_transaction.to_json
  end

  def connection
    @conn ||= begin
                conn = Bunny.new(host: "rabbitmq")
                conn.start
              end
  end

  def channel
    @channel ||= connection.create_channel
  end

  def queue
    @queue ||= channel.queue("transaction-#{fx_transaction.id}", durable: true)
  end

end
