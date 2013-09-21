# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/configuration'
require 'selenium_connect/runners/phantomjs'
require 'selenium-webdriver'

describe 'phantomjs runner' do
  it 'should match against phantomjs if configured as such' do
    config = SeleniumConnect::Configuration.new
    config.browser = 'phantomjs'
    runner = SeleniumConnect::Runner::PhantomJS.new(config)
    runner.match?.should be_true
  end

  it 'should not match if there is a different browser specified' do
    config = SeleniumConnect::Configuration.new
    config.browser = 'chrome'
    runner = SeleniumConnect::Runner::PhantomJS.new(config)
    runner.match?.should be_false
  end

  it 'should return a browser capabilities object for the browser on launch' do
    config = SeleniumConnect::Configuration.new
    config.browser = 'phantomjs'
    runner = SeleniumConnect::Runner::PhantomJS.new(config)
    runner.launch.is_a?(Selenium::WebDriver::Remote::Capabilities).should be true
  end
end
