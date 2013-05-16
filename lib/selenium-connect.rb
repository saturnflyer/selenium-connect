require 'selenium-webdriver'
require 'selenium-connect/configuration'
require 'selenium-connect/runner'
require 'selenium-connect/server'

module SeleniumConnect

  extend self
  attr_reader :config, :location, :server, :driver

  def configure
    yield configuration
  end

  def configuration
    @config = Configuration.new
  end

  def localhost?
    config.host == 'localhost'
  end

  def run
    if localhost?
      @server = Server.new(config)
      server.start
    end
    @driver = Runner.new(config).driver
  end

  def finish
    driver.quit
    if localhost? then server.stop end
  end

  alias :start :run
  alias :stop :finish
end
