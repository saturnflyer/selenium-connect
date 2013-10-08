# Encoding: utf-8

require 'selenium_connect/config/base'
require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/runner/remote'
require 'selenium_connect/config/runner/sauce'

module SeleniumConnect
  module Config
    class Default < Base

      attr_reader :runner, :job

      def initialize(runner, job, opts = {})
        @runner = runner
        @job = job
        super opts
      end

      def defaults
        {
          log_dir: nil
        }
      end

    end
  end
end
