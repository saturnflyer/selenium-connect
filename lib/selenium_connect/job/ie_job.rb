# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class IeJob < Base

      # there would be a method like run_with for each type of runner that this job supports
      # could be pulled out into mix in like LocallyRunnable or something for general behavior
      def run_with_sauce_runner(runner)
        # TODO: of course this gets refactored out and configurable
        # furthermore this should be a local file, found by testing rather than part of the codebase
        username = 'testing_arrgyle'
        access_key = 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a'
        opts = { username: username, access_key: access_key, browser: 'iexplore', version: '8' }
        runner.driver = Sauce::Selenium2.new(opts)
      end
    end
  end
end
