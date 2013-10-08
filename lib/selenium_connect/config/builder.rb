# Encoding: utf-8

require 'selenium_connect/config/runner/builder'
require 'selenium_connect/config/default'
require 'selenium_connect/config/job'

module SeleniumConnect
  module Config
    module Builder
      module_function

      def build(opts = {})
        defaults = { runner: {}, job: {} }
        opts = defaults.merge opts
        runner = SeleniumConnect::Config::Runner::Builder.build(opts.delete :runner)
        job = SeleniumConnect::Config::Job.new(opts.delete :job)
        SeleniumConnect::Config::Default.new(runner, job, opts)
      end
    end
  end
end
