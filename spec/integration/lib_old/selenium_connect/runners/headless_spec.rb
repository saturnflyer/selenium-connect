# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'Headless', selenium: true do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:quit)    { SeleniumConnect.finish }

  before(:each) do
    config = SeleniumConnect::Configuration.new browser: 'phantomjs'
    @sc = SeleniumConnect.start config
    @job = @sc.create_job
    @driver = @job.start
  end

  it 'should run a basic test with phantom js' do
    execute_simple_test @driver
  end

  it 'should not find something on a page' do
    google = ExamplePageObject.new @driver
    google.visit
    google.page_title.should_not include('Poogle')
  end

  after(:each) do
    @job.finish
    @sc.finish
  end

end
