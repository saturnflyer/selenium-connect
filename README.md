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
If host is set to "localhost", it will download the latest selenium-standalone-server.jar (unless it already has) and run it. Or, you can specify your own jar (if you have one you prefer to use). If no additional parameters are set, it will be exected in the background, with logging disabled. This functionality is driven using the [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html).

### Finish
Issues a quit command to the driver (and stops the local server if your host is set to "localhost").

### Support
- Firefox (standard, profile by path, profile by name, browser binary)
- Internet Explorer
- Chrome
- SauceLabs

## Contributing

This project conforms to the [neverstopbuilding/craftsmanship](https://github.com/neverstopbuilding/craftsmanship) guidelines. Specifically related to the branching model and versioning. Please see the guidelines for details.

### Install Dependencies

    bundle install

### Run the Tests

    bundle exec rspec
