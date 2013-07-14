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
end
