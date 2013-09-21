# Encoding: utf-8

require "selenium-webdriver"

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Job
    class LocalJob

      attr_reader :driver

      def start(browser)
        browser.start_dispatch(self)
      end

      def start_with_firefox(firefox_browser)
        @driver = Selenium::WebDriver.for :firefox
        self
      end

      def finish
        @driver.quit
      end

    end
  end
end

