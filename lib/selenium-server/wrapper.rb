module SeleniumServer
  def self.start
    rake "start"
  end

  def self.stop
    rake "stop"
  end

  def self.restart
    rake "restart"
  end

  private

  def self.rake(task)
    system "rake server:#{task}"
  end
end
