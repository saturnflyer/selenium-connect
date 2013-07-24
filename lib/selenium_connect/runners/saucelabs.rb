# Encoding: utf-8

require 'sauce'

# selenium connect
class SeleniumConnect
  # Runner
  class Runner
    # Sauce runner
    class Saucelabs
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def launch
        init_browser
      end

      private

      def get_credentials
        ENV['SAUCE_USERNAME'] = config.sauce_username
        ENV['SAUCE_ACCESS_KEY'] = config.sauce_api_key
      end

      def init_browser
        get_credentials
        Sauce::Selenium2.new(config.sauce_opts.marshal_dump)
      end

    end # Saucelabs
  end # Runner
end # SeleniumConnect
