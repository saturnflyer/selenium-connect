require 'selenium-connect'
require 'sauce'

describe "Sauce Labs" do

  it 'hello world', :wip => true do
    SeleniumConnect.configure do |c|
      c.host  = "saucelabs"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    driver.title.should include('Google')
    SeleniumConnect.finish
  end

end
