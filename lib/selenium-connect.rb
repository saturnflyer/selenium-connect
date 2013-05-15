require 'selenium-webdriver'
require 'selenium-connect/configuration'
require 'selenium-connect/runner'
require 'selenium-connect/server'
require 'selenium-connect/location'

module SeleniumConnect

  extend self
  attr_reader :config, :location, :server, :driver

  def configure
    yield config
  end

  def config
    @config = Configuration.new
  end

  def run
    @server = Location.new(config).get_location.execute
    @driver = Runner.new(config).driver
  end

  def finish
    driver.quit
    if location == 'localhost' then server.stop end
  end

  alias :start :run
  alias :stop :finish
end
