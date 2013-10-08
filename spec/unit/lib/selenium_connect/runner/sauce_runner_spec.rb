# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/sauce_runner'

describe SeleniumConnect::Runner::SauceRunner do
  let(:runner) do
    config = double 'SeleniumConnect::Config::Runner::Sauce'
    config.should_receive(:opts).and_return({})
    config.should_receive(:access_key).and_return('key')
    config.should_receive(:username).and_return('user')
    SeleniumConnect::Runner::SauceRunner.new(config)
  end

  it 'should respond to driver' do
    runner.should respond_to :driver
    runner.should respond_to :driver=
  end

  it 'should respond to finish' do
    runner.should respond_to :finish
  end
end
