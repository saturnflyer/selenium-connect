# Encoding: utf-8

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/runner/remote_runner'
require 'selenium_connect/runner/sauce_runner'

require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/runner/remote'
require 'selenium_connect/config/runner/sauce'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Runner
    module RunnerFactory
      module_function

      def build(config)
        type = config.type
        runner_type = type.to_s.gsub(/(?:^|_)([a-z])/){ $1.upcase }
        runner_class = const_get("SeleniumConnect::Runner::#{runner_type}Runner")
        runner_class.new(config)
      rescue NameError
        fail ArgumentError, "The runner \"#{type}\" is unknown."
      end

    end
  end
end
