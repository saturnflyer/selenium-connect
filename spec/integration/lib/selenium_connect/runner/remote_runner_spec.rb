# Encoding: utf-8

require 'spec_helper'
require 'selenium/server'

require 'selenium_connect/runner/remote_runner'
require 'selenium_connect/config/runner/remote'
require 'selenium_connect/config/job'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/job/chrome_job'
require 'selenium_connect/job/opera_job'
require 'selenium_connect/job/safari_job'
require 'selenium_connect/job/phantom_job'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Runner::RemoteRunner do

  SERVER_BIN = 'selenium-server-standalone-2.34.0.jar'

  let(:runner_config) { SeleniumConnect::Config::Runner::Remote.new }
  let(:job_config) { SeleniumConnect::Config::Job.new }

  before(:each) do
    server_bin = File.join(Dir.pwd, 'bin', SERVER_BIN)
    @server = Selenium::Server.new server_bin, background: true, log: '/tmp/ss.log'
  end

  it 'should run a firefox job on locally started remote by default', :system do
    @server.start
    @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::FirefoxJob.new job_config)
  end

  it 'should run a chrome job on locally started remote by default', :system do
    chrome_bin = File.join(Dir.pwd, 'bin', 'chromedriver')
    @server << "-Dwebdriver.chrome.driver=#{chrome_bin}"
    @server.start
    @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::ChromeJob.new job_config)
  end

  # TODO: this is throwing a strange error
  # 2.35 does not work
  it 'should run an opera job on locally started remote by default', :system do
    @server.start
    @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::OperaJob.new job_config)
  end

  it 'should run a safari job on locally started remote by default', :system do
    @server.start
    @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::SafariJob.new job_config)
  end

  # TODO: it seems like this should be pointing to the local bin
  it 'should run a phantom job on locally started remote by default', :system do
    @server.start
    @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::PhantomJob.new job_config)
  end

  it 'does not support an ie job remotely' do
    expect do
      @session  = SeleniumConnect::Runner::RemoteRunner.new(runner_config).run(SeleniumConnect::Job::IeJob.new job_config)
    end.to raise_error(ArgumentError, 'At the moment, SeleniumConnect does not support running "IeJob" with "RemoteRunner."')
  end

  after(:each) do
    if @session
      execute_simple_test @session.driver
      @session.finish
      @server.stop
      `pgrep -o -f #{SERVER_BIN}`.should be_empty
      pid = `pgrep -o -f #{SERVER_BIN}`
    `kill -9 #{pid}` unless pid.empty?
    end
  end

  after(:all) do
    # ensure that server is killed
    pid = `pgrep -o -f #{SERVER_BIN}`
    `kill -9 #{pid}` unless pid.empty?
  end
end
