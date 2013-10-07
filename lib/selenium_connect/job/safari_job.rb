# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class SafariJob < Base

      # this picks the specific runner method, this could be removed by havving the runner class
      # call the right runner method as it knows itself
      def run(runner)
        puts runner.class.inspect
        method = "run_with_#{to_snake_case(runner.class.name.split('::').last)}".intern
        send(method, runner)
      end

      # there would be a method like run_with for each type of runner that this job supports
      # could be pulled out into mix in like LocallyRunnable or something for general behavior
      def run_with_local_runner(runner)
        runner.driver = Selenium::WebDriver.for :safari
      end

      def run_with_sauce_runner(runner)
        # TODO: of course this gets refactored out and configurable
        # furthermore this should be a local file, found by testing rather than part of the codebase
        username = 'testing_arrgyle'
        access_key = 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a'
        opts = { username: username, access_key: access_key, browser: 'safari', version: 6, os: 'OS X 10.8' }
        runner.driver = Sauce::Selenium2.new(opts)
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: :safari)
      end

      private

        # this should be refactored out to a base class or a mixin
        def to_snake_case(string)
          string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').downcase
        end
    end
  end
end
