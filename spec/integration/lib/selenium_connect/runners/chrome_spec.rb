# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'Chrome', selenium: true do

  it 'localhost' do
    config = SeleniumConnect::Configuration.new browser: 'chrome'
    sc = SeleniumConnect.start config
    job = sc.create_job
    driver = job.start

    execute_simple_test driver

    job.finish
    sc.finish
  end

  it 'should work correctly with a configuration file' do
    config = SeleniumConnect::Configuration.new
    config.populate_with_yaml "#{ENV['SUPPORT_PATH']}/chrome.yaml"
    sc = SeleniumConnect.start config
    job = sc.create_job
    driver = job.start

    execute_simple_test driver

    job.finish failshot: true
    sc.finish

    File.exist?(File.join(ENV['BUILD_PATH'], 'tmp', 'chrome.log')).should be_true
    File.exist?(File.join(ENV['BUILD_PATH'], 'tmp', 'dom.html')).should be_true
    File.exist?(File.join(ENV['BUILD_PATH'], 'tmp', 'failshot.png')).should be_true
  end

  it 'should download all the dom dumps if there are multiple windows open' do
    config = SeleniumConnect::Configuration.new browser: 'firefox', log: '/build/tmp'
    sc = SeleniumConnect.start config
    job = sc.create_job
    driver = job.start

    driver.get 'http://the-internet.herokuapp.com/windows'
    driver.find_element(css: '.example a').click
    unless driver.title =~ /Poogle/
      # simulate a failure situation
      job.finish failed: true, failshot: true
    end
    File.exist?(File.join(ENV['BUILD_PATH'], 'tmp', 'dom_0.html')).should be_true
    File.exist?(File.join(ENV['BUILD_PATH'], 'tmp', 'dom_1.html')).should be_true
    sc.finish
  end
end
