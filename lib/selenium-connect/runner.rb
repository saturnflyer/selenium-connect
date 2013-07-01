# Encoding: utf-8

require 'selenium-connect/runners/firefox'
require 'selenium-connect/runners/ie'
require 'selenium-connect/runners/chrome'
require 'selenium-connect/runners/phantomjs'
require 'selenium-connect/runners/no_browser'
require 'selenium-connect/runners/saucelabs'

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
      if config.host == 'saucelabs'
        Saucelabs.new(config).launch
      else
        Selenium::WebDriver.for(
          :remote,
          url: set_server_url,
          desired_capabilities: get_browser
        )
      end
    end

    def get_browser
      browser = browsers.find { |found_browser| found_browser.match? }
      browser.launch
    end

    def browsers
      firefox     = Firefox.new(config)
      ie          = InternetExplorer.new(config)
      chrome      = Chrome.new(config)
      phantomjs   = PhantomJS.new(config)
      no_browser  = NoBrowser.new(config)
      [firefox, ie, chrome, phantomjs, no_browser]
    end

  end # Runner
end # SeleniumConnect
