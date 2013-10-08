# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class SafariJob < Base

      # there would be a method like run_with for each type of runner that this job supports
      # could be pulled out into mix in like LocallyRunnable or something for general behavior
      def run_with_local_runner(runner)
        runner.driver = Selenium::WebDriver.for :safari
      end

      def run_with_sauce_runner(runner)
        runner.opts.merge!({ browser: 'safari', version: 6, os: 'OS X 10.8' }).merge!(@opts)
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: :safari)
      end
    end
  end
end
