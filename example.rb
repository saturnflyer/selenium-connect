require 'selenium-server'

SeleniumServer.configure do |c|
  c.host          = "localhost"
  c.port          = "4444"
  c.profile_path  = "#{Dir.pwd}/profiles/alfresco"
  c.jar           = "/Users/more/Dropbox/_dev/ManTech/RAFT/vendor/selenium-server-standalone-2.32.0.jar"
end

@driver = SeleniumServer.start

@driver.get "http://www.google.com"

SeleniumServer.finish
