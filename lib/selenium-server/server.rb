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
    case task
      when "start"
        system "rake selenium:server:#{task} $"
      else
        system "rake selenium:server:#{task}"
   end
  end
end
