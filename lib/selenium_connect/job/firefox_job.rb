# Encoding: utf-8

require 'selenium_connect/job/base'
require 'selenium-webdriver'
require 'sauce'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class FirefoxJob < Base

      def run_with_local_runner(runner)
        runner.driver = Selenium::WebDriver.for :firefox
      end

      def run_with_sauce_runner(runner)
        runner.opts.merge!(@opts)
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote)
      end
    end
  end
end
