# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium_connect/job/binary_aware'

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Job
    class ChromeJob
      include BinaryAware

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
        Selenium::WebDriver::Chrome::Service.executable_path = binary_path 'chromedriver'
        runner.driver = Selenium::WebDriver.for :chrome
      end

      # def run_with_sauce_runner(runner)
      # end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote, desired_capabilities: :chrome)
      end

      private

        # this should be refactored out to a base class or a mixin
        def to_snake_case(string)
          string.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').downcase
        end
    end
  end
end
