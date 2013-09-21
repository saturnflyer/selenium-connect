# Encoding: utf-8

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  class Runner
    class RemoteRunner

      attr_accessor :driver

      def run(job)
        @driver = job.run(self)
        self
      end

      # here we would do any post job clean up stuff
      def finish
        @driver.quit
      end

    end
  end
end
