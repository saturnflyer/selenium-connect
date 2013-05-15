module SeleniumConnect
  class Configuration
    attr_accessor :host, :port, :browser, :browser_path,
                  :profile_path, :profile_name, :version,
                  :background, :log, :jar,
                  :sauce_username, :sauce_api_key,
                  :os, :browser, :browser_version

    def initialize
      defaults
    end

    private

    def defaults
      @host     = 'localhost' unless host
      @port     = 4444        unless port
      @log      = false       unless log
      @browser  = 'firefox'   unless browser
    end
  end
end
