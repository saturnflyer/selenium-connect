# Encoding: utf-8

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/runner/remote_runner'
require 'selenium_connect/runner/sauce_runner'

require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/runner/remote'
require 'selenium_connect/config/runner/sauce'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Runner
    module RunnerFactory
      module_function

      def build(opts)
        case opts[:type]
        when 'local'
          config = SeleniumConnect::Config::Runner::Local.new opts[:options]
          SeleniumConnect::Runner::LocalRunner.new config
        when 'remote'
          config = SeleniumConnect::Config::Runner::Remote.new opts[:options]
          SeleniumConnect::Runner::RemoteRunner.new config
        when 'sauce'
          config = SeleniumConnect::Config::Runner::Sauce.new opts[:options]
          SeleniumConnect::Runner::SauceRunner.new config
        else
          raise ArgumentError, "The runner \"#{opts[:type]}\" is unknown."
        end
      end

    end
  end
end
