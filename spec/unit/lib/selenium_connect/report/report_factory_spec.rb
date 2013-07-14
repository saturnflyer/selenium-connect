# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/report/report_factory'

describe SeleniumConnect::Report::ReportFactory do

  before(:each) do
    @report_factory = SeleniumConnect::Report::ReportFactory.new
  end

  it 'should return an empty main report' do
    report = @report_factory.build :main, {}
    report.should_not be_nil
  end

  it 'should return an empty job report' do
    report = @report_factory.build :job, {}
    report.should_not be_nil
  end

  it 'should throw an esception for unknown report type' do
    expect do
      @report_factory.build :not_real, {}
    end.to raise_error ArgumentError, 'Report type "not_real" unknown!'
  end
end
