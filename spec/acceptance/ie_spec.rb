# Encoding: utf-8

require 'selenium-connect'
require_relative 'helper'

describe 'IE', selenium: true do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:quit)    { SeleniumConnect.finish }

  it 'with Selenium Grid' do
    pending
    SeleniumConnect.configure do |c|
      c.host = '192.168.1.139'
      c.browser = 'ie'
    end
    driver.get 'https://mashup.ic.mantech.com/ispace'
    quit
  end
end

