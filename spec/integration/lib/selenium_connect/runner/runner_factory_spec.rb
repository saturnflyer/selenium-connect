# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/runner_factory'

describe SeleniumConnect::Runner::RunnerFactory do
  let(:factory) { SeleniumConnect::Runner::RunnerFactory }

  it 'should instantiate a local runner' do
    runner = factory.build type: 'local'
    runner.should be_an_instance_of SeleniumConnect::Runner::LocalRunner
  end

  it 'should instantiate a remote runner' do
    runner = factory.build type: 'remote'
    runner.should be_an_instance_of SeleniumConnect::Runner::RemoteRunner
  end

  it 'should instantiate a sauce runner' do
    runner = factory.build type: 'sauce'
    runner.should be_an_instance_of SeleniumConnect::Runner::SauceRunner
  end
end
