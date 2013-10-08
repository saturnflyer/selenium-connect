# Encoding: utf-8

require 'selenium_connect/job/job_factory'
require 'selenium_connect/runner/runner_factory'
require 'selenium_connect/config/builder'

# Selenium Connect main module
module SeleniumConnect
  module_function

  def start(opts = {})
    config = SeleniumConnect::Config::Builder.build opts
    runner = Runner::RunnerFactory.build config.runner
    job = Job::JobFactory.build config.job
    runner.run job
  end
end
