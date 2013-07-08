# Encoding: utf-8

require 'selenium-connect'

describe 'Sauce Labs', selenium: true do

  it 'hello world' do
    SeleniumConnect.configure do |c|
      c.log             = File.join(Dir.pwd, 'build', 'tmp')
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
    SeleniumConnect.finish
  end

end
