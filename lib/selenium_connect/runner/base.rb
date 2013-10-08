# Encoding: utf-8

module SeleniumConnect
  module Runner
    class Base

      attr_accessor :driver, :config

      def initialize(config)
        @opts = config.opts
      end

    end
  end
end
