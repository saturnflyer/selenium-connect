# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'YAML' do

  it 'setting config_file returns a proper config object' do
    SeleniumConnect.configure do |c|
      c.config_file = "#{ENV['SUPPORT_PATH']}/example.yaml"
    end
    config = SeleniumConnect.debug_config
    config.class.should eq SeleniumConnect::Configuration
    config.inspect.empty?.should be_false
  end

  it 'chrome', wip: true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{ENV['SUPPORT_PATH']}/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

  it 'chrome', wip: true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{ENV['SUPPORT_PATH']}/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

  it 'chrome', wip: true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{ENV['SUPPORT_PATH']}/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

  it 'chrome', wip: true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{ENV['SUPPORT_PATH']}/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end
end
