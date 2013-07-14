# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/configuration'

describe SeleniumConnect::Configuration do

  VALID_JAR = 'test.jar'
  VALID_HOST = '111.000.111.000'
  VALID_SAUCE_USERNAME = 'test_user_name'

  before :each do
    @configuration = SeleniumConnect::Configuration.new
  end

  it 'can recieve a simple hash of options on initialization' do
    config = SeleniumConnect::Configuration.new host: 'newhost'
    config.host.should == 'newhost'
  end

  it 'can be populated by a hash' do
    @configuration.populate_with_hash jar: VALID_JAR, host: VALID_HOST
    @configuration.jar.should eq VALID_JAR
    @configuration.host.should eq VALID_HOST
  end

  it 'can be populated with a yaml file' do
    @configuration.populate_with_yaml "#{ENV['SUPPORT_PATH']}/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'supports the config_file= method' do
    @configuration.config_file= "#{ENV['SUPPORT_PATH']}/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'should throw an exception for unsupported config variable' do
    expect do
      @configuration.populate_with_hash  bad: 'config-value'
    end.to raise_error ArgumentError, 'The config key: "bad" is unknown!'
  end

  it 'sensible defaults persist when nothing is set' do
    @configuration.host.should eq     'localhost'
    @configuration.port.should eq     4444
    @configuration.browser.should eq  'firefox'
  end
end
