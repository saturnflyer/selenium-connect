module SeleniumConnect
  class Configuration
    #Selenium Server
    attr_accessor :host, :port, :version,
                  :background, :log, :jar

    #Browsers
    attr_accessor :browser, :browser_path,
                  :profile_path, :profile_name

    #SauceLabs
    attr_accessor :sauce_username, :sauce_api_key,
                  :os, :browser_version, :description

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
