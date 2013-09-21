# Encoding: utf-8

require 'spec_helper'
require 'selenium-connect'

describe SeleniumConnect do
  it 'should allow the old require statement' do
    config = double 'SeleniumConnect::Configuration'
    allow(config).to receive(:is_a?).and_return(true)
    allow(config).to receive(:host).and_return(false)
    report_factory = double 'SeleniumConnect::Report::ReportFactory'
    selenium_connect = SeleniumConnect.new config, report_factory
    selenium_connect.should be_an_instance_of SeleniumConnect
  end
end
