# Encoding: utf-8

require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Job
    module JobFactory
      module_function

      def build(name)
        case name
        when 'firefox'
          SeleniumConnect::Job::FirefoxJob.new
        when 'chrome'
          SeleniumConnect::Job::ChromeJob.new
        when 'safari'
          SeleniumConnect::Job::SafariJob.new
        when 'opera'
          SeleniumConnect::Job::OperaJob.new
        when 'ie'
          SeleniumConnect::Job::IeJob.new
        when 'phantom'
          SeleniumConnect::Job::PhantomJob.new
        else
          raise ArgumentError, "The job \"#{name}\" is unknown."
        end
      end

    end
  end
end
