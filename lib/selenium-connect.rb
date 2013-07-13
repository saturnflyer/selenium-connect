# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium-connect/configuration'
require 'selenium-connect/runner'
require 'selenium-connect/server'
require 'sauce/client'
require 'rest_client'

# Selenium Connect main module
module SeleniumConnect

  extend self
  attr_reader :config, :config_file, :location, :server, :driver

  def configure
    yield configuration
  end

  def configuration
    @config = Configuration.new
  end

  def localhost?
    config.host == 'localhost'
  end

  def debug_config
    config
  end

  def run
    if localhost?
      @server = Server.new(config)
      server.start
    end
    @driver = Runner.new(config).driver
  end

  def job_info(id)
    sauce_client = Sauce::Client.new
    sauce_job = Sauce::Job.find(id)
    # poll while job is in progress
    while sauce_job.status == 'in progress'
      sleep 5
      sauce_job.refresh!
    end

    url = "#{sauce_client.api_url}jobs/#{id}/assets/"
    response = RestClient::Request.new(
      method: :get,
      url: url
    ).execute

    puts response
  end

  def finish
    # TODO this should grow into a standardized artifact returned
    # by the driver
    return_data = {}
    begin
      driver.quit
      return_data = fetch_logs if config.host == 'saucelabs'
    # rubocop:disable HandleExceptions
    rescue Selenium::WebDriver::Error::WebDriverError
      # rubocop:enable HandleExceptions
      # no-op
    end
    server.stop if localhost?

    return_data
  end

  def fetch_logs
    # this could be pulled out into the specific sauce runner
    job_id = driver.session_id
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

    log_file = File.join(Dir.getwd, config.log, "sauce_job_#{job_id}.log") if config.log

    File.open(log_file, 'w') do |log|
      log.write response
    end
    { sauce_job: sauce_job }
  end

  alias_method :start, :run
  alias_method :stop, :finish
end
