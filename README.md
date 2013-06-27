#selenium-connect [![Code Climate](https://codeclimate.com/github/arrgyle/selenium-connect.png)](https://codeclimate.com/github/arrgyle/selenium-connect)

A stupid simple way to run your Selenium tests on your computer, against a Selenium Grid, or in the cloud (e.g. SauceLabs).

## Getting Started
```ruby
require 'selenium-connect'

SeleniumConnect.configure do |c|
  c.host         = "localhost" #or "grid_ip_address" or "saucelabs"
  c.browser      = "firefox"
end

@driver = SeleniumConnect.start
@driver.get "http://www.google.com"
SeleniumConnect.finish
```

## Helpful bits

### Start
If host is set to "localhost" and no jar file is specified, it will run the version of [selenium-standalone-server.jar](https://code.google.com/p/selenium/downloads/list) that is bundled with the library (currently 2.33.0). Or, you can specify your own jar if you have one you prefer to use. This is done with c.jar = 'path-to-jar-file'.  

If no additional parameters are set, the Selenium Server will be run in the background with logging disabled. If a logging directory is provided (with c.log = 'path-to-log-dir') then 3 output files will be generated:  
+ Selenium Server JSON Wire Protocol output (server.log)  
+ Browser output (browser.log) -- currently only available for Firefox  
+ Test output (SPEC-testname.xml)  

This localhost functionality is driven using the [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html).  

### Finish
The finish command issues a quit command to the driver and stops the local server if your host is set to "localhost".

### Support
- [Firefox](https://github.com/arrgyle/selenium-connect/blob/develop/spec/acceptance/firefox_spec.rb)  
- [Chrome](https://github.com/arrgyle/selenium-connect/blob/develop/spec/acceptance/chrome_spec.rb)  
- [Internet Explorer](https://github.com/arrgyle/selenium-connect/blob/develop/spec/acceptance/ie_spec.rb)  
- [PhantomJS](https://github.com/arrgyle/selenium-connect/blob/develop/spec/acceptance/headless_spec.rb)  
- [SauceLabs](https://github.com/arrgyle/selenium-connect/blob/develop/spec/acceptance/sauce_spec.rb)  

## Contributing

This project conforms to the [neverstopbuilding/craftsmanship](https://github.com/neverstopbuilding/craftsmanship) guidelines. Specifically related to the branching model and versioning. Please see the guidelines for details.

### Install Dependencies

    bundle install

### Run the Tests

    bundle exec rake build
