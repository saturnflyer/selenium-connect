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
        case type
        when 'local'
          SeleniumConnect::Runner::LocalRunner.new config
        when 'remote'
          SeleniumConnect::Runner::RemoteRunner.new config
        when 'sauce'
          SeleniumConnect::Runner::SauceRunner.new config
        else
          fail ArgumentError, "The runner \"#{type}\" is unknown."
        end
      end

    end
  end
end
