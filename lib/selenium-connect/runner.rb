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

    def get_profile
      if configuration.profile_path
        Selenium::WebDriver::Firefox::Profile.new configuration.profile_path
      elsif configuration.profile_name
        Selenium::WebDriver::Firefox::Profile.from_name configuration.profile_name
      end
    end

    def set_profile
      profile = get_profile
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
