# Encoding: utf-8
require 'selenium_connect/runner'
require 'sauce/client'
require 'rest_client'
require 'selenium-webdriver'
require 'json'

# selenium connect
class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Job

    def initialize(config, report_factory)
      @config = config
      @report_factory = report_factory
    end

    # Creates and returns the driver, using options passed in
    def start(opts = {})

      # TODO this could be refactored out into an options parser of sorts
      @config.description = opts[:name] if opts.has_key? :name

      @driver = Runner.new(@config).driver
    end

    # Finishes the driver run, taking any data to help, returning report
    def finish(opts = {})

      # extracted from the earlier main finish
      begin
        @driver.quit
        if @config.host == 'saucelabs'
          if opts.has_key?(:failed) && opts[:failed]
            update_job_passed(false)
          end
          if opts.has_key?(:passed) && opts[:passed]
            update_job_passed(true)
          end
          data = fetch_logs
          report_data = symbolize_keys sauce_data: data
        end
      # rubocop:disable HandleExceptions
      rescue Selenium::WebDriver::Error::WebDriverError
      # rubocop:enable HandleExceptions
      end

      @report_factory.build :job, report_data
    end

    private

      def update_job_passed(bool)
        job_id = @driver.session_id
        # sauce_client = Sauce::Client.new
        sauce_job = Sauce::Job.find(job_id)
        sauce_job.passed = bool
        sauce_job.save
      end

      def fetch_logs
        # this could be pulled out into the specific sauce runner
        job_id = @driver.session_id
        sauce_client = Sauce::Client.new
        sauce_job = Sauce::Job.find(job_id)
        # poll while job is in progress
        while sauce_job.status == 'in progress'
          sleep 5
          sauce_job.refresh!
        end

        url = "#{sauce_client.api_url}jobs/#{job_id}/assets/selenium-server.log"
        response = RestClient::Request.new(
          method: :get,
          url: url
        ).execute

        log_file = File.join(Dir.getwd, @config.log, "sauce_job_#{job_id}.log") if @config.log

        File.open(log_file, 'w') do |log|
          log.write response
        end
        JSON.parse(sauce_job.to_json)
      end

      # TODO this should be pulled out into a generic report... or something
      def symbolize_keys(hash)
        hash.reduce({}) do |result, (key, value)|
          new_key = key.class == String ? key.to_sym : key
          new_value = value.class == Hash ? symbolize_keys(value) : value
          result[new_key] = new_value
          result
        end
      end
  end
end

