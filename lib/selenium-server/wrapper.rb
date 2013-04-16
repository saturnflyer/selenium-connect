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

  def self.rake_file
    "#{Dir.pwd}/lib/selenium-server/rake.task"
  end

  def self.rake(task)
    system "rake -f #{rake_file} server:#{task}"
  end
end
