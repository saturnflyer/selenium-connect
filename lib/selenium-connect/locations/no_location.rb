module SeleniumConnect
  class Location
    class NoLocation
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        true
      end

      def execute
      end

    end #NoLocation
  end #Location
end #SeleniumConnect
