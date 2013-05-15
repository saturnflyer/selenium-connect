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
      end

    end #NoLocation
  end #Location
end #SeleniumConnect
