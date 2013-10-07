# Encoding: utf-8

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Runner
    class LocalRunner

      attr_accessor :driver

      def initialize(config)
        @config = config
      end

      def run(job)
        begin
          @driver = job.run(self)
        rescue NoMethodError
          raise ArgumentError, "At the moment, SeleniumConnect does not support running \"#{job.class.name.split('::').last}\" with \"#{self.class.name.split('::').last}.\""
        end
        self
      end

      # here we would do any post job clean up stuff
      def finish
        @driver.quit
      end

    end
  end
end
