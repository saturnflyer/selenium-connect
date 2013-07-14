# Encoding: utf-8
require 'selenium_connect/runner'
require 'sauce/client'
require 'rest_client'
require 'selenium-webdriver'
require 'json'
require 'sauce_whisk'
require 'curb'

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
        job_id = @driver.session_id
        if @config.host == 'saucelabs'
          if opts.has_key?(:failed) && opts[:failed]
            fail_job job_id
            if opts.has_key?(:failshot) && opts[:failshot]
              save_last_screenshot job_id
            end
          end
          if opts.has_key?(:passed) && opts[:passed]
            pass_job job_id
          end
          data = fetch_logs(job_id)
          report_data = symbolize_keys sauce_data: data
        end
      # rubocop:disable HandleExceptions
      rescue Selenium::WebDriver::Error::WebDriverError
      # rubocop:enable HandleExceptions
      end

      @report_factory.build :job, report_data
    end

    private

      # TODO all this sauce stuff needs to be pulled out of the job class
      # TODO need to put error handling around the sauce api requests
      def save_last_screenshot(job_id)
        begin
        # Seemingly need to wait slightly for the images to be processed
        sleep(2)
        image = SauceWhisk::Jobs.fetch_asset job_id, 'final_screenshot.png'
        image_file = File.join(Dir.getwd, @config.log, "failed_#{job_id}.png") if @config.log
        File.open(image_file, 'w') { |f| f.write image }
        rescue RestClient::ResourceNotFound
          puts 'Unable to download image!'
        end
      end

      def fail_job(job_id)
        SauceWhisk::Jobs.fail_job job_id
      end

      def pass_job(job_id)
        SauceWhisk::Jobs.pass_job job_id
      end

      def fetch_logs(job_id)
        sauce_job = Sauce::Job.find(job_id)
        # Seemingly need to wait slightly for the images to be processed
        sleep(2)
        server_log = SauceWhisk::Jobs.fetch_asset job_id, 'selenium-server.log'
        log_file = File.join(Dir.getwd, @config.log, "sauce_job_#{job_id}.log") if @config.log
        File.open(log_file, 'w') { |f| f.write server_log }
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

