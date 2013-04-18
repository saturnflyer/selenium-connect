module SeleniumServer
  class Runner
    attr_reader :driver

    def initialize(configuration)
      location_checker(configuration.host)
      @driver = initialize_server(configuration)
    end

    private

    def location_checker(host)
      case host
        when "localhost"
          Server.start
      end
    end

    def set_profile(profile_path)
      profile = Selenium::WebDriver::Firefox::Profile.new(profile_path)
      profile.assume_untrusted_certificate_issuer = false
      Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
    end

    def set_server_url(host, port)
      "http://#{host}:#{port}/wd/hub"
    end

    def initialize_server(configuration)
      Selenium::WebDriver::Remote::Bridge.new(
        :url => set_server_url(configuration.host, configuration.port),
        :desired_capabilities => set_profile(configuration.profile_path))
    end
  end
end
