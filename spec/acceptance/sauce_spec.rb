# Encoding: utf-8

require 'selenium-connect'

describe 'Sauce Labs', selenium: true do

  it 'hello world' do
    SeleniumConnect.configure do |c|
      c.log             = File.join('build', 'tmp')
      c.host            = 'saucelabs'
      c.sauce_username  = 'testing_arrgyle'
      c.sauce_api_key   = 'ab7a6e17-16df-42d2-9ef6-c8d2539cc38a'
      c.os              = 'windows'
      c.browser         = 'iexplore'
      c.browser_version = '7'
      c.description     = 'hello world from selenium-connect!'
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    driver.title.should include('Google')
    id = driver.session_id
    data = SeleniumConnect.finish
    File.exist?(File.join(Dir.pwd, 'build', 'tmp', "sauce_job_#{id}.log")).should be_true
    data.empty?.should be_false
  end

end
