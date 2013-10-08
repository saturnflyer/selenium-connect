# Encoding: utf-8

require 'selenium_connect/config/base'

module SeleniumConnect
  module Config
    module Runner
      class Remote < Config::Base

        def defaults
          {}
        end

        def type
          'remote'
        end

      end
    end
  end
end
