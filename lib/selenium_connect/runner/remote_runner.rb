# Encoding: utf-8

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Runner
    class RemoteRunner

      attr_accessor :driver

      def run(job)
        @driver = job.run(self)
        self
      end

      # here we would do any post job clean up stuff
      def finish
        @driver.quit
      end

    end
  end
end

# Encoding: utf-8

# require "selenium-webdriver"
# require 'selenium/server'

# class SeleniumConnect
#   # encapsulates the creation of a driver and a run
#   class Job
#     class RemoteJob

#       attr_reader :driver

#       def initialize
#           @server = Selenium::Server.new(
#             File.join(Dir.getwd,'bin', 'selenium-server-standalone-2.35.0.jar'),
#             background: true,
#             log: '/tmp/test-ses.log'
#             )
#           @server.start
#       end

#       def start(browser)
#         browser.start_dispatch(self)
#       end

#       def start_with_firefox(firefox_browser)
#         @driver = Selenium::WebDriver.for(
#           :remote,
#           url: 'http://127.0.0.1:4444/wd/hub'
#         )
#         self
#       end

#       def finish
#         @driver.quit
#         @server.stop
#       end

#     end
#   end
# end
