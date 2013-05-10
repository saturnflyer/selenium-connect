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

      def init_browser
        profile = get_profile
        profile.assume_untrusted_certificate_issuer = false unless profile.nil?
        @capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
      end

    end #Firefox
  end #Runner
end #SeleniumConnect
