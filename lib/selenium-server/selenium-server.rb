module SeleniumServer
  extend self

  def configure
    yield configuration
  end

  def configuration
    @configuration = Configuration.new
  end

  attr_reader :server

  def localhost?
    case @configuration.host
      when "localhost" then true
      else false
    end
  end

  def run
    if localhost?
      @server = Server.new(@configuration)
      server.start
    end
    Runner.new(@configuration).driver
  end

  def finish
    if localhost? then server.stop end
  end

  alias :start :run
  alias :stop :finish
end
