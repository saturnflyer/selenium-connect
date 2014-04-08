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
          config = defaults.merge opts

          type = config.type
          runner_type = type.to_s.gsub(/(?:^|_)([a-z])/){ $1.upcase }
          runner_class = const_get("SeleniumConnect::Config::Runner::#{runner_type}")
          runner_class.new(config.fetch(:options))
        rescue NameError
          fail ArgumentException, "Unknown type: \"#{type}\" passed to runner config builder."
        end

      end
    end
  end
end
