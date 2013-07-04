# Encoding: utf-8

require 'selenium-webdriver'
require 'selenium-connect/configuration'
require 'selenium-connect/runner'
require 'selenium-connect/server'

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

  def finish
    begin
      driver.quit
    # rubocop:disable HandleExceptions
    rescue Selenium::WebDriver::Error::WebDriverError
      # rubocop:enable HandleExceptions
      # no-op
    end
    server.stop if localhost?
  end

  alias_method :start, :run
  alias_method :stop, :finish
end
