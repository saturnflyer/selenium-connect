module SeleniumConnect
  class Configuration
    attr_accessor :host, :port, :browser, :browser_path
    attr_accessor :profile_path, :profile_name, :version
    attr_accessor :background, :log, :jar
    attr_accessor :sauce_username, :sauce_api_key
    attr_accessor :os, :browser, :browser_version

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
