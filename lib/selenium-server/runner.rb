#browser type determines server type
#browser type determines config params
#initializer *should* be the same

module SeleniumServer
  class Runner
    attr_reader :driver, :configuration

    def initialize(configuration)
      @configuration = configuration
      set_sensible_defaults
      @driver = initialize_selenium
    end

    private

    def set_sensible_defaults
      configuration.host     = "localhost" unless configuration.host
      configuration.port     = "4444"      unless configuration.port
      configuration.browser  = "firefox"   unless configuration.browser
    end

    def set_profile
      profile = Selenium::WebDriver::Firefox::Profile.new(configuration.profile_path)
      profile.assume_untrusted_certificate_issuer = false
      Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
    end

    def set_server_url
      "http://#{configuration.host}:#{configuration.port}/wd/hub"
    end

    def initialize_selenium
      Selenium::WebDriver::Remote::Bridge.new(
        :url => set_server_url,
        :desired_capabilities => set_profile)
    end
  end
end
