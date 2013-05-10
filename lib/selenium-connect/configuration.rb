module SeleniumConnect
  class Configuration
    attr_accessor :host, :port, :browser, :profile_path, :profile_name, :version, :background, :log, :jar

    def initialize
      defaults
    end

    private

    def defaults
      @host     = "localhost" unless host
      @port     = "4444"      unless port
      @browser  = "firefox"   unless browser
      @log      = false       unless log
    end
  end
end
