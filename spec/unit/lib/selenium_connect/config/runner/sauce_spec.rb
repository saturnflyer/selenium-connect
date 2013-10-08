# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/runner/sauce'

describe SeleniumConnect::Config::Runner::Sauce do

  let(:config) { SeleniumConnect::Config::Runner::Sauce.new }

  it 'should throw an exception if you ask for the username and it is nil' do
    expect do
      config.username
    end.to raise_error ArgumentError, 'The sauce username must be defined. Please do so.'
  end

  it 'should throw an exception if you ask for the access_key and it is nil' do
    expect do
      config.access_key
    end.to raise_error ArgumentError, 'The sauce access_key must be defined. Please do so.'
  end

  it 'it should merge in sym => value pairs' do
    opts = {
      username: 'test',
      access_key: 'key',
      something: 'other',
      api_timeout: 100
    }
    sauce_config = SeleniumConnect::Config::Runner::Sauce.new(opts)
    sauce_config.username.should eq 'test'
    sauce_config.access_key.should eq 'key'
    sauce_config.something.should eq 'other'
    sauce_config.api_timeout.should eq 100
  end

end
