# Encoding: utf-8

require 'selenium_connect/config/base'
require 'selenium_connect/config/job'
require 'selenium_connect/config/runner/local'

module SeleniumConnect
  module Config
    class Default < Base

      def defaults
        {
          log_dir: '/tmp'
        }
      end

      def initialize
        super
        @opts[:runner] = SeleniumConnect::Config::Runner::Local.new
        @opts[:job] = SeleniumConnect::Config::Job.new
      end

    end
  end
end
