module SeleniumConnect
  class Runner
    class InternetExplorer
      attr_reader :config, :capabilities

      def initialize(config)
        @config = config
        init_browser
      end

      private

      def init_browser
        @capabilities = config.browser.to_sym
      end

    end #InternetExplorer
  end #Runner
end #SeleniumConnect
