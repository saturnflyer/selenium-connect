# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/sauce_runner'
require 'selenium_connect/config/runner/sauce'
require 'selenium_connect/config/job'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Runner::SauceRunner, :headless do

  let(:runner_config) do
    opts = {
      username: 'testing_arrgyle',
      access_key: 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a',
      log_dir: ENV['LOG_PATH']
    }
    SeleniumConnect::Config::Runner::Sauce.new opts
  end

  let(:job_config) do
    opts = {
      job_name: 'Sauce Runner Test Job',
      tags: %w[tag1 tag2],
      build: 'test build'
    }
    SeleniumConnect::Config::Job.new opts
  end

  it 'should run a firefox job with sauce', :system do
    @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::FirefoxJob.new job_config)
    ensure_successful 'firefox'
  end

  it 'should run a chrome job with sauce', :system do
    @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::ChromeJob.new job_config)
    ensure_successful 'googlechrome'
  end

  it 'should run an opera job with sauce', :system do
    @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::OperaJob.new job_config)
    ensure_successful 'opera'
  end

  it 'should run a safari job with sauce', :system do
    @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::SafariJob.new job_config)
    ensure_successful 'safari'
  end

  it 'should run an Ie job with sauce', :system do
    @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::IeJob.new job_config)
    ensure_successful 'iexplore'
  end

  it 'does not support a phamtom job with sauce' do
    expect do
      @session = SeleniumConnect::Runner::SauceRunner.new(runner_config).run(SeleniumConnect::Job::PhantomJob.new job_config)
    end.to raise_error(ArgumentError, 'At the moment, SeleniumConnect does not support running "PhantomJob" with "SauceRunner."')
  end

  def ensure_successful(browser)
    if @session
      execute_simple_test @session.driver
      data = @session.finish status: 'passed'
      data[:sauce_job][:browser].should eq browser
      data[:sauce_job][:name].should eq 'Sauce Runner Test Job'
      data[:sauce_job][:tags].should include('tag1')
      data[:sauce_job][:tags].should include('tag2')
      data[:sauce_job][:passed].should be_true

      log_file_exists?('dom_0.html')
      log_file_exists?('failshot.png')
      log_file_exists?('session.json')
      log_file_exists?('server.log')
    end
  end

end
