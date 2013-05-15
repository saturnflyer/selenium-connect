module SeleniumConnect
  class Location
    class Saucelabs
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        config.host == 'saucelabs'
      end

      def execute
        Sauce.config do |c|
          c.browsers = [
            [ config.os, config.browser, config.browser_version ]
          ]
        end
      end

    end #SauceLabs
  end #Location
end #SeleniumConnect
