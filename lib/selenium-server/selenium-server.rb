module SeleniumServer
  extend self

  def configure
    yield configuration
  end

  def configuration
    @configuration = Configuration.new
  end

  def run
    runner = Runner.new(@configuration)
    return runner.driver
  end

  alias :show_time :run
end
