# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'Sauce Labs', selenium: true do

  before(:each) do
    opts = {
      log: File.join('build', 'tmp'),
      host: 'saucelabs',
      sauce_username: 'testing_arrgyle',
      sauce_api_key: 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a',
      os: 'windows',
      browser: 'iexplore',
      browser_version: '7',
    }
    config = SeleniumConnect::Configuration.new opts
    @sc = SeleniumConnect.start config
  end

  it 'hello world' do
    job = @sc.create_job
    driver = job.start name: 'some random job name'
    execute_simple_test driver
    report = job.finish
    sauce_id = report.data[:sauce_data][:id]
    report.data[:sauce_data][:name].should be == 'some random job name'
    File.exist?(File.join(Dir.pwd, 'build', 'tmp', "sauce_job_#{sauce_id}.log")).should be_true
  end

  after(:each) do
    @sc.finish
  end
end
