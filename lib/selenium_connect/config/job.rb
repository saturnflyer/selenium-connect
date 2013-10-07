# Encoding: utf-8

require 'selenium_connect/config/base'

module SeleniumConnect
  module Config
    class Job < Base

      def defaults
        {
          browser: 'firefox'
        }
      end

    end
  end
end
