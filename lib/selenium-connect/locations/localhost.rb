module SeleniumConnect
  class Location
    class Localhost
      attr_reader :config, :server

      def initialize(config)
        @config = config
      end

      def match?
        config.host == 'localhost'
      end

      def execute
        @server = Server.new(config)
        server.start
      end

    end #LocalHost
  end #Location
end #SeleniumConnect
