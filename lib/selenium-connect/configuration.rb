module SeleniumConnect
  class Configuration
    attr_accessor :host, :port, :browser, :profile_path, :version, :background, :log, :jar

    def initialize
      set_sensible_defaults
    end

    private

    def set_sensible_defaults
      host     = "localhost" unless host
      port     = "4444"      unless port
      browser  = "firefox"   unless browser
    end
  end
end
