# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'

describe SeleniumConnect::Runner::LocalRunner do

  it 'should run a firefox job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::FirefoxJob.new)
  end

  it 'should run a chrome job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::ChromeJob.new)
  end

  it 'should run an opera job locally' do
    pending 'Known issue launching opera.'
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::OperaJob.new)
  end

  it 'should run a safari job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::SafariJob.new)
  end

  it 'should run a phantom job locally' do
    @job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::PhantomJob.new)
  end

  after(:each) do
    if @job
      execute_simple_test @job.driver
      @job.finish
    end
  end
end
