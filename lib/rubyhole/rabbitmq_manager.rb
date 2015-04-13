require 'bunny'

module Rubyhole
  class RabbitMqManager
    attr_reader :conn, :ch

    def initialize(conn)
      @conn = conn
      @ch = nil
    end

    def create_channel
      close_channel
      @ch = @conn.create_channel
      @ch
    end

    def close_channel
      unless @ch.nil?
        @ch.close if @ch.status == :open
      end
    end

    def bind(ch, x, data)
      ch.queue('', :auto_delete => true).bind(x, :routing_key => data['routing_key'])
    end

    def subscribe(q, ws)
      q.subscribe(:block => false, :manual_ack => false) do |delivery_info, properties, payload|
        #ws.send "Received #{payload}, message properties are #{properties.inspect}"
        ws.send payload
      end
    end
  end
end