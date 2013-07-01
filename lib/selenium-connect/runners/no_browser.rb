# Encoding: utf-8

module SeleniumConnect
  class Runner
    class NoBrowser
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        true
      end

      def execute
        puts 'Please specify a valid browser.'
        exit 1
      end

    end # NoBrowser
  end # Runner
end # SeleniumConnect
