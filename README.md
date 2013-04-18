#selenium-server
===============

Let's make configuring and running Selenium Server simple!

This includes a wrapper for [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html) -- used to download, start, stop, and restart selenium-standalone-server.jar.

## Getting Started
```ruby
require 'selenium-server'
SeleniumMagic.configure do |c|
  c.host         = "localhost"
  c.port         = "4444"
  c.browser      = "firefox"
  c.profile_path = "#{Dir.pwd}/profiles/alfresco"
end
@driver = SeleniumMagic.show_time
@driver.get "http://www.google.com"
@driver.quit
SeleniumServer::Server.stop
```  

## Helpful bits
The start action will download the latest selenium-standalone-server.jar (unless it already has) and run it, backgrounded, with logging disabled.
