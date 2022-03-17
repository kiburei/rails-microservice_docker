require 'bunny'
class Publisher
  class << self

    def publish(exchange, message = {})
      x = channel.fanout("fx_transactions.#{exchange}")
      x.publish(message.to_json)
    end

    def channel
      @channel ||= connection.create_channel
    end

    def connection
      @connection ||= Bunny.new(host: "rabbitmq").tap(&:start)
    end

  end
end
