module SeleniumConnect
  class Runner
    class Firefox
      attr_reader :config, :capabilities

      def initialize(config)
        @config = config
        init_browser
      end

      private

      def get_profile
        if config.profile_path
          Selenium::WebDriver::Firefox::Profile.new config.profile_path
        elsif config.profile_name
          Selenium::WebDriver::Firefox::Profile.from_name config.profile_name
        end
      end

      def set_path
      end

      def init_browser
        profile = get_profile
        profile.assume_untrusted_certificate_issuer = false unless profile.nil?
        browser = Selenium::WebDriver::Remote::Capabilities.firefox
        browser[:firefox_binary] = config.browser_path if config.browser_path
        browser[:firefox_profile] = profile
        @capabilities = browser
      end

    end #Firefox
  end #Runner
end #SeleniumConnect
