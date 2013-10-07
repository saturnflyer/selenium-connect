# Encoding: utf-8

module SeleniumConnect
  module Runner
    class Base

      attr_accessor :driver

      def initialize(config)
        @config = config
      end

    end
  end
end
