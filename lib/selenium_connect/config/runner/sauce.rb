# Encoding: utf-8

require 'selenium_connect/config/base'

module SeleniumConnect
  module Config
    module Runner
      class Sauce < Config::Base

        def defaults
          {
          username: nil,
          api_key: nil,
          api_timeout: 10
          }
        end

        def username
          @opts[:username] ||= raise ArgumentError, 'The sauce username must be defined. Please do so.'
        end

        def api_key
          @opts[:api_key] ||= raise ArgumentError, 'The sauce api_key must be defined. Please do so.'
        end

      end
    end
  end
end
