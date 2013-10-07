# Encoding: utf-8

require 'selenium_connect/runner/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Runner
    class SauceRunner < Base

      def run(job)
        begin
          @driver = job.run_with_sauce_runner(self)
        rescue NoMethodError
          raise ArgumentError, "At the moment, SeleniumConnect does not support running \"#{job.class.name.split('::').last}\" with \"#{self.class.name.split('::').last}.\""
        end
        self
      end

      # here we would do any post job clean up stuff
      def finish
        @driver.quit
      end

    end
  end
end
