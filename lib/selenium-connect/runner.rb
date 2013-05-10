require 'selenium-connect/runner/firefox'
require 'selenium-connect/runner/ie'

module SeleniumConnect
  class Runner
    attr_reader :driver, :config

    def initialize(config)
      @config = config
      @driver = init_driver
    end

    private

    def set_server_url
      "http://#{config.host}:#{config.port}/wd/hub"
    end

    def init_driver
      Selenium::WebDriver.for(
        :remote,
        :url => set_server_url,
        :desired_capabilities => get_capabilities)
    end

    def get_capabilities
      case config.browser
        when "firefox"
          Firefox.new(config).capabilities
        when "ie"
          InternetExplorer.new(config).capabilities
        else
          puts "No valid browser specified"
      end
    end

  end #Runner
end #SeleniumConnect
