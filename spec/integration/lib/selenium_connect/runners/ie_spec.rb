# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'IE', selenium: true do

  it 'with Selenium Grid' do
    pending 'not yet implemented'
    opts = {
      host: '192.168.1.139',
      browser: 'ie'
    }
    config = SeleniumConnect::Configuration.new opts
    sc = SeleniumConnect.start config
    job = sc.create_job
    driver = job.start
    execute_simple_test driver
    job.finish
    sc.finish
  end

end

