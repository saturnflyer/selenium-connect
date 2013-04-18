require 'selenium-server'

SeleniumServer.configure do |c|
  c.host          = "localhost"
  c.port          = "4444"
  c.profile_path  = "#{Dir.pwd}/profiles/alfresco"
end

@driver = SeleniumServer.start

@driver.get "http://www.google.com"

SeleniumServer.finish
