# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/report/job_report'

describe SeleniumConnect::Report::JobReport do

  before(:each) do
    @data = { key: 'value' }
    @report = SeleniumConnect::Report::JobReport.new @data
  end

  it 'should be initialized with data' do
    @report.should be_an_instance_of SeleniumConnect::Report::JobReport
  end

  it 'should simply return the data for now' do
    @report.data.should be @data
  end
end
