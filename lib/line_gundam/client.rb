# frozen_string_literal: true

module LineGundam
  class Client
    class << self
      def send_message(type: 'text', text: [])
        client = Faraday.new
        client.post(LineGundam.configuration.broadcast_url, payload(type, text).to_json, headers)
      end

      def payload(type, text)
        {
          messages: text.map { |txt| { type: type, text: txt } }
        }
      end

      def headers
        {
          'Authorization' => "Bearer #{LineGundam.configuration.access_token}",
          'Content-Type' => 'application/json'
        }
      end
    end
  end
end
