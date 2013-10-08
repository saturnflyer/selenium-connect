# Encoding: utf-8

require 'selenium_connect/job/job_factory'
require 'selenium_connect/runner/runner_factory'

# Selenium Connect main module
module SeleniumConnect
  module_function

  def run_job(opts = {})



    runner = Runner::RunnerFactory.build 'local'
    job = Job::JobFactory.build 'firefox'
    runner.run job
  end
end
