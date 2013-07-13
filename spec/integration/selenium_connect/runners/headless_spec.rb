# Encoding: utf-8

require 'selenium_connect'
require_relative 'helper'

describe 'Headless', selenium: true do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:quit)    { SeleniumConnect.finish }

  it 'should run a basic test with phantom js' do
    SeleniumConnect.configure do |c|
      c.browser = 'phantomjs'
    end
    google.visit
    google.page_title.should include('Google')
    quit
  end

  it 'should not find something on a page' do
    SeleniumConnect.configure do |c|
      c.browser = 'phantomjs'
    end
    google.visit
    google.page_title.should_not include('Poogle')
    quit
  end

end
