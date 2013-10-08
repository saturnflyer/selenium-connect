# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/sauce_runner'
require 'selenium_connect/config/runner/sauce'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Runner::SauceRunner do

  let(:runner_config) do
    opts = {
      username: 'testing_arrgyle',
      api_key: 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a'
    }
    SeleniumConnect::Config::Runner::Sauce.new opts
  end
  let(:mock_job_config) { double 'SeleniumConnect::Config::Job' }

  it 'should run a firefox job with sauce', :system do
    @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::FirefoxJob.new mock_job_config)
  end

  it 'should run a chrome job with sauce', :system do
    @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::ChromeJob.new mock_job_config)
  end

  it 'should run an opera job with sauce', :system do
    @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::OperaJob.new mock_job_config)
  end

  it 'should run a safari job with sauce', :system do
    @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::SafariJob.new mock_job_config)
  end

  it 'should run an Ie job with sauce', :system do
    @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::IeJob.new mock_job_config)
  end

  it 'does not support a phamtom job with sauce' do
    expect do
      @job  = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::PhantomJob.new mock_job_config)
    end.to raise_error(ArgumentError, 'At the moment, SeleniumConnect does not support running "PhantomJob" with "SauceRunner."')
  end

  after(:each) do
    if @job
      execute_simple_test @job.driver
      @job.finish
    end
  end
end
