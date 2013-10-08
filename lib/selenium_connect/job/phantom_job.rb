# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/binary_aware'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class PhantomJob < Base
      include BinaryAware

      # there would be a method like run_with for each type of runner that this job supports
      # could be pulled out into mix in like LocallyRunnable or something for general behavior
      def run_with_local_runner(runner)
        Selenium::WebDriver::PhantomJS.path = binary_path 'phantomjs'
        runner.driver = Selenium::WebDriver.for :phantomjs
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: :phantomjs)
      end
    end
  end
end
