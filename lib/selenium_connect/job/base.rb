# Encoding: utf-8

module SeleniumConnect
  module Job
    class Base

      def initialize(config)
        @opts = config.opts
        @opts.delete :browser
      end

    end
  end
end
