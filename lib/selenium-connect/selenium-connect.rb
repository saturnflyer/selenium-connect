module SeleniumConnect
  extend self

  def configure
    yield configuration
  end

  def configuration
    @configuration = Configuration.new
  end

  attr_reader :server, :driver

  def localhost?
    @configuration.host == 'localhost' ? true : false
  end

  def run
    if localhost?
      @server = Server.new(@configuration)
      server.start
    end
    @driver = Runner.new(@configuration).driver
  end

  def finish
    driver.quit
    if localhost? then server.stop end
  end

  alias :start :run
  alias :stop :finish
end
