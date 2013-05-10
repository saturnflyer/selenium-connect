module SeleniumConnect
  class Runner
    class Firefox
      attr_reader :config, :capabilities

      def initialize(config)
        @config = config
        set_profile
      end

      private

      def get_profile
        if config.profile_path
          Selenium::WebDriver::Firefox::Profile.new config.profile_path
        elsif config.profile_name
          Selenium::WebDriver::Firefox::Profile.from_name config.profile_name
        end
      end

      def set_profile
        profile = get_profile
        profile.assume_untrusted_certificate_issuer = false unless profile.nil?
        @capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
      end

    end #Firefox

    class InternetExplorer
    end #InternetExplorer
  end #Runner
end #SeleniumConnect

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
