# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/binary_aware'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class ChromeJob < Base
      include BinaryAware

      def run_with_local_runner(runner)
        Selenium::WebDriver::Chrome::Service.executable_path = binary_path 'chromedriver'
        runner.driver = Selenium::WebDriver.for :chrome
      end

      def run_with_sauce_runner(runner)
        runner.opts.merge!({ browser: 'chrome', version: 27 }).merge!(@opts)
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: :chrome)
      end
    end
  end
end
