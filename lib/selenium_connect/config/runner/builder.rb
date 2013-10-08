# Encoding: utf-8

require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/runner/sauce'
require 'selenium_connect/config/runner/remote'

module SeleniumConnect
  module Config
    module Runner
      module Builder
        module_function

      def build(opts = {})
        defaults = { type: 'local', options: {} }
        opts = defaults.merge opts
        case opts[:type]
        when 'sauce'
          Sauce.new opts[:options]
        when 'remote'
          Remote.new opts[:options]
        when 'local'
          Local.new opts[:options]
        else
          fail ArgumentException, "Unknown type: \"#{type}\" passed to runner config builder."
        end
      end
      end
    end
  end
end
