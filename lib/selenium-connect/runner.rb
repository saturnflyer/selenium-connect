require 'selenium-connect/runner/firefox'
require 'selenium-connect/runner/ie'
require 'selenium-connect/runner/chrome'
require 'selenium-connect/runner/no_browser'

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
        :desired_capabilities => get_browser)
    end

    def browsers
      firefox     = Firefox.new(config)
      ie          = InternetExplorer.new(config)
      chrome      = Chrome.new(config)
      no_browser  = NoBrowser.new(config)

      browsers = [ firefox, ie, chrome ]
    end

    def get_browser
      browser = browsers.find { |browser| browser.match? }
      browser.execute
    end

  end #Runner
end #SeleniumConnect
