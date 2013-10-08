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

      def build(config)
        case config.browser
        when 'firefox'
          SeleniumConnect::Job::FirefoxJob.new config
        when 'chrome'
          SeleniumConnect::Job::ChromeJob.new config
        when 'safari'
          SeleniumConnect::Job::SafariJob.new config
        when 'opera'
          SeleniumConnect::Job::OperaJob.new config
        when 'ie'
          SeleniumConnect::Job::IeJob.new config
        when 'phantom'
          SeleniumConnect::Job::PhantomJob.new config
        else
          fail ArgumentError, "The job \"#{opts[:browser]}\" is unknown."
        end
      end

    end
  end
end
