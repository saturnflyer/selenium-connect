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
          @opts[:username] ||= fail ArgumentError, 'The sauce username must be defined. Please do so.'
        end

        def api_key
          @opts[:api_key] ||= fail ArgumentError, 'The sauce api_key must be defined. Please do so.'
        end

        def type
          'sauce'
        end

      end
    end
  end
end
