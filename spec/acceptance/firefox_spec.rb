# Encoding: utf-8

require 'selenium-connect'
require_relative 'helper'

describe 'Firefox', selenium: true do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:quit)    { SeleniumConnect.finish }

  it 'blank config' do
    SeleniumConnect.configure {}
    google.visit
    google.page_title.should include('Google')
    quit
  end

  it 'localhost' do
    SeleniumConnect.configure do |c|
      c.host  = 'localhost'
    end
    google.visit
    google.page_title.should include('Google')
    quit
  end

  it 'local jar file specified' do
    SeleniumConnect.configure do |c|
      c.host  = 'localhost'
      c.jar   = "#{Dir.pwd}/bin/selenium-server-standalone-2.33.0.jar"
    end
    google.visit
    google.page_title.should include('Google')
    quit
  end

  it 'profile name' do
    pending 'requires machine setup to run, and need a public example'
    SeleniumConnect.configure do |c|
      c.profile_name  = 'YourProfileNameGoesHere'
    end
  end

  it 'profile path' do
    pending 'need to add a profile to the repo'
    SeleniumConnect.configure do |c|
      c.profile_path  = "#{Dir.pwd}/path/to/profile"
    end
  end

  it 'browser path' do
    # example only works on Mac
    SeleniumConnect.configure do |c|
      c.browser = 'firefox'
      c.browser_path = '/Applications/Firefox.app/Contents/MacOS/firefox'
    end
    google.visit
    google.page_title.should include('Google')
    quit
  end

end
