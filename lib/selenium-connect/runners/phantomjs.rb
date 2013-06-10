module SeleniumConnect
  class Runner
    class PhantomJS
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        config.browser == "phantomjs"
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
