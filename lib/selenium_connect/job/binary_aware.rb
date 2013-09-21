# Encoding: utf-8

class SeleniumConnect
  class Job
    module BinaryAware

      def binary_path(name)
        binary_dir = File.join(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..')), 'bin')
        case name
        when 'chromedriver'
          return File.join(binary_dir, 'chromedriver')
        when 'phantomjs'
          return File.join(binary_dir, 'phantomjs')
        when 'selenium'
          return File.join(binary_dir, 'selenium-server-standalone-2.34.0.jar')
        else
          raise ArgumentError, "Unknown binary: \"#{name}\""
        end
      end

    end
  end
end
