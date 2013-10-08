# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/runner_factory'
require 'selenium_connect/config/runner/local'
require 'selenium_connect/config/runner/remote'
require 'selenium_connect/config/runner/sauce'

describe SeleniumConnect::Runner::RunnerFactory do
  let(:factory) { SeleniumConnect::Runner::RunnerFactory }

  it 'should instantiate a local runner' do
    config = SeleniumConnect::Config::Runner::Local.new
    runner = factory.build config
    runner.should be_an_instance_of SeleniumConnect::Runner::LocalRunner
  end

  it 'should instantiate a remote runner' do
    config = SeleniumConnect::Config::Runner::Remote.new
    runner = factory.build config
    runner.should be_an_instance_of SeleniumConnect::Runner::RemoteRunner
  end

  it 'should instantiate a sauce runner' do
    config = SeleniumConnect::Config::Runner::Sauce.new username: 'user', access_key: 'key'
    runner = factory.build config
    runner.should be_an_instance_of SeleniumConnect::Runner::SauceRunner
  end
end
