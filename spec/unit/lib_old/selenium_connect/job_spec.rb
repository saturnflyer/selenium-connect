# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job'

describe SeleniumConnect::Job do

  before(:each) do
    config = double 'SeleniumConnect::Configuration'
    report_factory = double 'SeleniumConnect::Report::ReportFactory'
    sauce_facade = double 'Sauce::SauceFacade'
    @report = double 'SeleniumConnect::Report::JobReport'
    allow(report_factory).to receive(:build).and_return(@report)
    @job = SeleniumConnect::Job.new config, report_factory, sauce_facade
  end

  it 'should be initialized' do
    @job.should be_an_instance_of SeleniumConnect::Job
  end

  it 'should respond to start' do
    @job.should respond_to :start
  end

  it 'should return the driver on start' do
    pending('need to pass in something to build the driver here...')
    @job.start
  end

  it 'should respond to finish' do
    @job.should respond_to :finish
  end

  it 'should return a report on finish' do
    pending('need to pass in something to build the driver here...')
    @job.finish.should be @report
  end
end

