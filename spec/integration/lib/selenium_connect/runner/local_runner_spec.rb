# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Runner::LocalRunner do

  let(:mock_config) { double 'SeleniumConnect::Config::Runner::Local' }
  let(:mock_job_config) { double 'SeleniumConnect::Config::Job' }

  it 'should run a firefox job locally', :system do
    @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::FirefoxJob.new mock_job_config)
  end

  it 'should run a chrome job locally', :system do
    @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::ChromeJob.new mock_job_config)
  end

  it 'should run an opera job locally', :system do
    @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::OperaJob.new mock_job_config)
  end

  it 'should run a safari job locally', :system do
    @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::SafariJob.new mock_job_config)
  end

  it 'should run a phantom job locally', :system do
    @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::PhantomJob.new mock_job_config)
  end

  it 'does not support an ie job locally' do
    expect do
      @job  = SeleniumConnect::Runner::LocalRunner.new(mock_config).run(SeleniumConnect::Job::IeJob.new mock_job_config)
    end.to raise_error(ArgumentError, 'At the moment, SeleniumConnect does not support running "IeJob" with "LocalRunner."')
  end

  after(:each) do
    if @job
      execute_simple_test @job.driver
      @job.finish
    end
  end
end
