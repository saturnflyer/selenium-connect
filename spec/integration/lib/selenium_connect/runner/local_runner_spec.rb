# Encoding: utf-8

require 'spec_helper'

require 'selenium_connect/runner/local_runner'
require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/job'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Runner::LocalRunner do

  let(:runner_config) do
    opts = {
      log_dir: ENV['LOG_PATH']
    }
    SeleniumConnect::Config::Runner::Local.new opts
  end
  let(:job_config) { SeleniumConnect::Config::Job.new }

  it 'should run a firefox job locally', :system do
    @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::FirefoxJob.new job_config)
    ensure_complete
  end

  it 'should run a chrome job locally', :system do
    @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::ChromeJob.new job_config)
    ensure_complete
  end

  it 'should run an opera job locally', :system do
    @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::OperaJob.new job_config)
    ensure_complete
  end

  it 'should run a safari job locally', :system do
    @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::SafariJob.new job_config)
    # TODO: Right now the safari webdriver implementation does not support screenshotting
    execute_simple_test @session.driver
    @session.finish
    log_file_exists?('dom_0.html')
    log_file_exists?('session.json')
  end

  it 'should run a phantom job locally', :system, :headless do
    @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::PhantomJob.new job_config)
    ensure_complete
  end

  it 'does not support an ie job locally' do
    expect do
      @session  = SeleniumConnect::Runner::LocalRunner.new(runner_config).run(SeleniumConnect::Job::IeJob.new job_config)
    end.to raise_error(ArgumentError, 'At the moment, SeleniumConnect does not support running "IeJob" with "LocalRunner."')
  end

  def ensure_complete
    if @session
      execute_simple_test @session.driver
      @session.finish

      log_file_exists?('dom_0.html')
      log_file_exists?('failshot.png')
      log_file_exists?('session.json')
    end

  end
end
