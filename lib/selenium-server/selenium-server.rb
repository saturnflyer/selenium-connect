module SeleniumServer
  extend self

  def configure
    yield configuration
  end

  def configuration
    @configuration = Configuration.new
  end

  attr_reader :driver

  def localhost?
    case @configuration.host
      when "localhost" then true
      else false
    end
  end

  def run
    if localhost? then Server.start end
    @driver = Runner.new(@configuration).driver
    return driver
  end

  def finish
    driver.quit
    if localhost? then Server.stop end
  end

  alias :start :run
  alias :stop :finish
end
