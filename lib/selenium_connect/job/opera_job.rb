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
        runner.opts.merge!({ browser: 'opera', version: 12 }).merge!(@opts)
      end

      def run_with_remote_runner(runner)
        caps = Selenium::WebDriver::Remote::Capabilities.opera(platform: :mac, 'opera.binary' => '/Applications/Opera.app/Contents/MacOS/Opera')
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: caps)
      end
    end
  end
end
