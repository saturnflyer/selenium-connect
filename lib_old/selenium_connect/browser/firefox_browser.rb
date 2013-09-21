# Encoding: utf-8

class SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Browser
    class FirefoxBrowser
      def start_dispatch(job)
        job.start_with_firefox(self)
      end
    end
  end
end


