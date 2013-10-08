# Encoding: utf-8

require 'selenium_connect/runner/base'
require 'selenium_connect/service/sauce/facade'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Runner
    class SauceRunner < Base

      def initialize(config)
        super config
        @sauce_facade = Service::Sauce::Facade.new(@opts.delete(:api_timeout), config.username, config.access_key)
      end

      def run(job)
        begin
          job.run_with_sauce_runner(self)
          @driver = Sauce::Selenium2.new(@opts)
          @sauce_facade.job_id = @driver.session_id
        rescue NoMethodError
          raise ArgumentError, "At the moment, SeleniumConnect does not support running \"#{job.class.name.split('::').last}\" with \"#{self.class.name.split('::').last}.\""
        end
        self
      end

      def after_driver_quit(opts)

        if opts.key?(:passed)
          if opts[:status] == 'passed'
            @sauce_facade.pass_job
          else
            @sauce_facade.fail_job
          end
        end

        save_asset('server.log') { @sauce_facade.fetch_server_log }
        @session[:sauce_job] = @sauce_facade.fetch_job_data
        super
      end

    end
  end
end
