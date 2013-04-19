require 'selenium-connect'

SeleniumConnect.configure do |c|
  c.host          = "localhost"
  c.port          = "4444"
end

@driver = SeleniumConnect.start

@driver.get "http://www.google.com"

SeleniumConnect.finish
