# Encoding: utf-8

module SeleniumConnect
  module Runner
    class Base

      attr_accessor :driver, :opts

      def initialize(config)
        @opts = config.opts
      end

    end
  end
end
