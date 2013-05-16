require 'sauce'

module SeleniumConnect
  class Runner
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
        Sauce::Selenium2.new({
          :os               =>  config.os,
          :browser          =>  config.browser,
          :browser_version  =>  config.browser_version,
          :job_name         =>  config.description })
      end

    end #Saucelabs
  end #Runner
end #SeleniumConnect
