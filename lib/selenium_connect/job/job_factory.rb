# Encoding: utf-8

require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    module JobFactory
      module_function

      def build(opts)
        case opts[:browser]
        when 'firefox'
          SeleniumConnect::Job::FirefoxJob.new opts
        when 'chrome'
          SeleniumConnect::Job::ChromeJob.new opts
        when 'safari'
          SeleniumConnect::Job::SafariJob.new opts
        when 'opera'
          SeleniumConnect::Job::OperaJob.new opts
        when 'ie'
          SeleniumConnect::Job::IeJob.new opts
        when 'phantom'
          SeleniumConnect::Job::PhantomJob.new opts
        else
          raise ArgumentError, "The job \"#{opts[:browser]}\" is unknown."
        end
      end

    end
  end
end
