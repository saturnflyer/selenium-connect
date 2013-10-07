# Encoding: utf-8

require 'selenium_connect/config/base'

module SeleniumConnect
  module Config
    class Default < Base

      def defaults
        {
          log_dir: '/tmp'
        }
      end

    end
  end
end
