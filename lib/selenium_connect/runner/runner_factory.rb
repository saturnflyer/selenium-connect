# Encoding: utf-8

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/runner/remote_runner'
require 'selenium_connect/runner/sauce_runner'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Runner
    module RunnerFactory
      module_function

      def build(name)
        case name
        when 'local'
          SeleniumConnect::Runner::LocalRunner.new
        when 'remote'
          SeleniumConnect::Runner::RemoteRunner.new
        when 'sauce'
          SeleniumConnect::Runner::SauceRunner.new
        else
          raise ArgumentError, "The runner \"#{name}\" is unknown."
        end
      end

    end
  end
end
