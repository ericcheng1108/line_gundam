# frozen_string_literal: true

require_relative 'line_gundam/version'

module LineGundam
  class Configuration
    BROADCAST_URL = 'https://api.line.me/v2/bot/message/broadcast'

    attr_accessor :access_token
    attr_accessor :broadcast_url

    def initialize
      @access_token = ''
      @broadcast_url = BROADCAST_URL
    end
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      block_given? ? yield(configuration) : configuration
    end
  end


  class Error < StandardError; end
end
