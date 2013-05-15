module SeleniumConnect
  class Runner
    class Chrome
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        config.browser == "chrome"
      end

      def launch
        init_browser
      end

      private

      def init_browser
        config.browser.to_sym
      end

    end #Chrome
  end #Runner
end #SeleniumConnect
