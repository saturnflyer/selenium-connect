# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe SeleniumConnect do

  before(:each) do
    @config = double 'SeleniumConnect::Configuration'
    allow(@config).to receive(:is_a?).and_return(true)
    allow(@config).to receive(:host).and_return(false)

    report_factory = double 'SeleniumConnect::Report::ReportFactory'
    @report = double 'SeleniumConnect::Report::MainReport'

    allow(report_factory).to receive(:build).and_return(@report)

    @selenium_connect = SeleniumConnect.new @config, report_factory

  end

  it 'should be created with the start method' do
    SeleniumConnect.should respond_to :start
    SeleniumConnect.start(@config).should be_an_instance_of SeleniumConnect
  end

  it 'can be initialized' do
    @selenium_connect.should be_an_instance_of SeleniumConnect
  end

  it 'should fail for non config object' do
    ['foo', nil, 10, { bar: 'baz' }].each do |config|
      expect do
        SeleniumConnect.new config, nil
      end.to raise_error ArgumentError, 'Instance of SeleniumConnect::Configuration expected.'
    end
  end

  it 'can return the config' do
    sc = SeleniumConnect.start @config
    sc.config.should be @config
  end

  it 'should respond to finish' do
    sc = SeleniumConnect.start @config
    sc.should respond_to :finish
  end

  it 'should return an main report on finish' do
    @selenium_connect.finish.should be @report
  end

  it 'should respond to create_job' do
    opts = { name: 'test-job' }
    @selenium_connect.create_job opts
  end
end

