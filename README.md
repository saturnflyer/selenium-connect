#selenium-server
===============

This library aims to make configuring and running your test suites against Selenium Server simple for both local execution and pointing it at a grid.

It includes a wrapper for [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html) -- used to download, start, stop, and restart selenium-standalone-server.jar.

## Getting Started
```ruby
require 'selenium-server'

SeleniumServer.configure do |c|
  c.host         = "localhost"
  c.browser      = "firefox"
  c.profile_path = "#{Dir.pwd}/profiles/your_custom_firefox_profile"
end

@driver = SeleniumServer.start

@driver.get "http://www.google.com"

SeleniumServer.finish
```  

## Helpful bits

### Selenium Actions Reference  
This library uses the Selenium WebDriver Remote Bridge actions. You can find them [here](http://www.ruby-doc.org/gems/docs/b/bbc-selenium-webdriver-1.17.0/Selenium/WebDriver/Remote/Bridge.html).  

### Start  
If host is set to "localhost", it will download the latest selenium-standalone-server.jar (unless it already has) and run it, backgrounded, with logging disabled, and run your Selenium commands against it.  

### Finish  
Issues a quit command to the driver (and stops the local server if your host is set to "localhost").  

### Support  
Currently, Firefox is is all that is supported. More coming soon!
