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

  it 'just execute a sauce job successfully' do
    job = @sc.create_job
    name = 'successful sauce job'
    driver = job.start name: name
    execute_simple_test driver
    report = job.finish passed: true
    sauce_id = report.data[:sauce_data][:id]
    report.data[:sauce_data][:name].should be == name
    report.data[:sauce_data][:passed].should be === true
    File.exist?(File.join(Dir.pwd, 'build', 'tmp', "sauce_job_#{sauce_id}.log")).should be_true
  end

  it 'should mark a sauce job as failed' do
    job = @sc.create_job
    name = 'failing sauce job'
    driver = job.start name: name
    # we don't even need to run anything
    report = job.finish failed: true
    report.data[:sauce_data][:passed].should be === false
  end

  after(:each) do
    @sc.finish
  end
end
