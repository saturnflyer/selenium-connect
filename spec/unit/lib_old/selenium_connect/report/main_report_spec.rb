# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/report/main_report'

describe SeleniumConnect::Report::MainReport do

  before(:each) do
    @data = { key: 'value' }
    @report = SeleniumConnect::Report::MainReport.new @data
  end

  it 'should be initialized with data' do
    @report.should be_an_instance_of SeleniumConnect::Report::MainReport
  end

  it 'should simply return the data for now' do
    @report.data.should be @data
  end
end
