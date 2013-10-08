# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/builder'

describe SeleniumConnect::Config::Builder do

  it 'should return a default configuration' do
    config = SeleniumConnect::Config::Builder.build
    config.runner.should be_an_instance_of SeleniumConnect::Config::Runner::Local
    config.job.should be_an_instance_of SeleniumConnect::Config::Job
    config.runner.type.should eq 'local'
    config.job.browser.should eq 'firefox'
  end

end
