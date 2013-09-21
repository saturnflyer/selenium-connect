# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'

describe SeleniumConnect::Runner::LocalRunner do

  it 'should run a firefox job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::FirefoxJob.new)
  end

  it 'should run a chrome job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::ChromeJob.new)
  end

  after(:each) do
    execute_simple_test @job.driver
    @job.finish
  end
end
