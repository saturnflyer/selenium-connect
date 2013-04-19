#browser type determines server type
#browser type determines config params
#initializer *should* be the same

module SeleniumConnect
  class Runner
    attr_reader :driver, :configuration

    def initialize(configuration)
      @configuration = configuration
      @driver = initialize_driver
    end

    private

    def set_server_url
      "http://#{configuration.host}:#{configuration.port}/wd/hub"
    end

    def set_profile
      profile = Selenium::WebDriver::Firefox::Profile.new(configuration.profile_path)
      profile.assume_untrusted_certificate_issuer = false
      Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
    end

    def initialize_driver
      Selenium::WebDriver::Remote::Bridge.new(
        :url => set_server_url,
        :desired_capabilities => set_profile)
    end
  end
end
