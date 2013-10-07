# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/binary_aware'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class OperaJob < Base
      include BinaryAware

      # there would be a method like run_with for each type of runner that this job supports
      # could be pulled out into mix in like LocallyRunnable or something for general behavior
      def run_with_local_runner(runner)
        Selenium::WebDriver::Opera::Service.selenium_server_jar = binary_path 'selenium', '2.34.0'
        # ENV['SELENIUM_SERVER_JAR'] = binary_path 'selenium'
        runner.driver = Selenium::WebDriver.for :opera
      end

      def run_with_sauce_runner(runner)
        # TODO: of course this gets refactored out and configurable
        # furthermore this should be a local file, found by testing rather than part of the codebase
        username = 'testing_arrgyle'
        access_key = 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a'
        opts = { username: username, access_key: access_key, browser: 'opera', version: 12 }
        runner.driver = Sauce::Selenium2.new(opts)
      end

      def run_with_remote_runner(runner)
        caps = Selenium::WebDriver::Remote::Capabilities.opera(platform: :mac, 'opera.binary' => '/Applications/Opera.app/Contents/MacOS/Opera')
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: caps)
      end

      private

        # this should be refactored out to a base class or a mixin
        def to_snake_case(string)
          string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').downcase
        end
    end
  end
end
