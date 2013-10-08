# Encoding: utf-8

require 'selenium_connect/config/base'

module SeleniumConnect
  module Config
    module Runner
      class Local < Config::Base

        def defaults
          {}
        end

        def type
          'local'
        end

      end
    end
  end
end
