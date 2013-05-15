#selenium-connect [![Code Climate](https://codeclimate.com/github/arrgyle/selenium-connect.png)](https://codeclimate.com/github/arrgyle/selenium-connect)

This library aims to make configuring and running your Selenium tests against a Selenium Server simple for both local (e.g. your own computer or grid) and cloud execution.  

## Getting Started
```ruby
require 'selenium-connect'

SeleniumConnect.configure do |c|
  c.host         = "localhost"
  c.browser      = "firefox"
end

@driver = SeleniumConnect.start
@driver.get "http://www.google.com"
SeleniumConnect.finish
```  

## Helpful bits

### Start  
If host is set to "localhost", it will download the latest selenium-standalone-server.jar (unless it already has) and run it. Or, you can specify your own jar (if you have one you prefer to use). If no additional parameters are set, it will be exected in the background, with logging disabled. This functionality is driven using the [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html). 

### Finish  
Issues a quit command to the driver (and stops the local server if your host is set to "localhost").  

### Support  
Currently, Firefox solo & with a pre-fab custom profile is all that is supported. More coming soon!  

### Versioning  
This project loosely follows [Semantic Versioning](http://semver.org/).
