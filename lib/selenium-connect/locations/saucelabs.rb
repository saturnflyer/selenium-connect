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
          c.browsers = [ ['windows', 'firefox', '18'] ]
        end
      end

    end #NoLocation
  end #Location
end #SeleniumConnect
