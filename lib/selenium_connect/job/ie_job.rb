# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class IeJob < Base

      def run_with_sauce_runner(runner)
        runner.opts.merge!({ browser: 'iexplore', version: '8' }).merge!(@opts)
      end

    end
  end
end
