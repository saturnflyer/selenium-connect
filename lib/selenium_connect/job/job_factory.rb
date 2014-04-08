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
        browser = config.browser
        job_type = browser.to_s.gsub(/(?:^|_)([a-z])/){ $1.upcase }
        job_class = const_get("SeleniumConnect::Job::#{job_type}Job")
        job_class.new(config)
      rescue NameError
        fail ArgumentError, "The job \"#{browser}\" is unknown."
      end

    end
  end
end
