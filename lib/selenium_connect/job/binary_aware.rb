# Encoding: utf-8

module SeleniumConnect
  module Job
    module BinaryAware

      def binary_path(name, version = nil)
        binary_dir = File.join(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..')), 'bin')
        case name
        when 'chromedriver'
          return File.join(binary_dir, 'chromedriver')
        when 'phantomjs'
          return File.join(binary_dir, 'phantomjs')
        when 'selenium'
          version ||= '2.35.0'
          return File.join(binary_dir, "selenium-server-standalone-#{version}.jar")
        else
          raise ArgumentError, "Unknown binary: \"#{name}\""
        end
      end

    end
  end
end
