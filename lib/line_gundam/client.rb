# frozen_string_literal: true

module LineGundam
  class Client
    class << self
      def send_message(type: 'text', text: [])
        client = Faraday.new
        client.post(LineGundam.configure.broadcast_url, payload(type, text), headers)
      end

      def payload(type, text)
        {
          messages: text.map { |txt| { type: type, text: txt } }
        }.to_json
      end

      def headers
        {
          'Authorization' => "Bearer #{LineGundam.configure.access_token}",
          'Content-Type' => 'application/json'
        }
      end
    end
  end
end
