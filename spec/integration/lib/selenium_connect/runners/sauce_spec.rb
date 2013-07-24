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
      description: 'test description'
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
    report.data[:sauce_data][:name].should be == 'successful_sauce_job'
    report.data[:sauce_data][:passed].should be_true
    report.data[:assets][:server_log].should be == "passed_serverlog_successful_sauce_job_#{sauce_id}.log"
    File.exist?(File.join(Dir.pwd, 'build', 'tmp', "passed_serverlog_successful_sauce_job_#{sauce_id}.log")).should be_true
  end

  it 'should mark a sauce job as failed' do
    job = @sc.create_job
    name = 'failing sauce job'
    job.start name: name
    # we don't even need to run anything
    report = job.finish failed: true
    report.data[:sauce_data][:passed].should be false
  end

  it 'should download a screenshot on failure' do
    # pending 'need to resolve the api issues first'
    job = @sc.create_job
    name = 'failshot'
    driver = job.start name: name

    driver.get 'http://www.yahoo.com'
    driver.get 'http://www.google.com'

    unless driver.title =~ /Poogle/
      # simulate a failure situation
      report = job.finish failed: true, failshot: true
    end
    sauce_id = report.data[:sauce_data][:id]
    report.data[:sauce_data][:passed].should be false
    report.data[:assets][:failshot].should be == "failed_failshot_failshot_#{sauce_id}.png"
    File.exist?(File.join(Dir.pwd, 'build', 'tmp', "failed_failshot_failshot_#{sauce_id}.png")).should be_true
  end

  after(:each) do
    @sc.finish
  end
end
