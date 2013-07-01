# Encoding: utf-8

require 'selenium-connect/configuration'

describe SeleniumConnect::Configuration do

  VALID_JAR = 'test.jar'
  VALID_HOST = '111.000.111.000'
  VALID_SAUCE_USERNAME = 'test_user_name'

  before :each do
    @configuration = SeleniumConnect::Configuration.new
  end

  it 'can be populated by a hash' do
    @configuration.populate_with_hash jar: VALID_JAR, host: VALID_HOST
    @configuration.jar.should eq VALID_JAR
    @configuration.host.should eq VALID_HOST
  end

  it 'can be populated with yaml' do
    @configuration.populate_with_yaml "#{Dir.pwd}/spec/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'can also be populated by setting a file' do
    @configuration.config_file = "#{Dir.pwd}/spec/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'should throw an exception for unsupported config variable' do
    expect {
        @configuration.populate_with_hash bad: 'config-value'
      }.to raise_error NoMethodError
  end
end
