[![Gem Version](https://badge.fury.io/rb/selenium-connect.png)](http://badge.fury.io/rb/selenium-connect) [![Build Status](https://travis-ci.org/arrgyle/selenium-connect.png)](https://travis-ci.org/arrgyle/selenium-connect) [![Code Climate](https://codeclimate.com/github/arrgyle/selenium-connect.png)](https://codeclimate.com/github/arrgyle/selenium-connect) [![Coverage Status](https://coveralls.io/repos/arrgyle/selenium-connect/badge.png)](https://coveralls.io/r/arrgyle/selenium-connect)

#selenium-connect
A stupid simple way to run your Selenium tests on your computer, against a Selenium Grid, or in the cloud (e.g. SauceLabs).

All the documentation for Selenium Connect can be found in this README, organized as follows:

- [Getting Started](#getting-started)
- [Helpful Bits](#helpful-bits)
- [Configuration](#configuration)
- [Contribution Guidelines](#contribution-guidelines)
- [Deployment](#deployment)

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

## Helpful Bits

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

## Configuration
Coming soon!

## Contribution Guidelines

This project conforms to the [neverstopbuilding/craftsmanship](https://github.com/neverstopbuilding/craftsmanship) guidelines. Specifically related to the branching model and versioning. Please see the guidelines for details.

### Install Dependencies

    bundle install

### Run the Tests!

```
rake              # defaults to 'build' task, code quality, unit, and integration tests
rake unit         # unit tests
rake integration  # integration tests
rake system       # system tests
```

### Or get your Guard On!

Running:

    guard

Will start watching the code and run the unit tests on save. Cool.

## Deployment
The release process is rather automated, just use one rake task with the new version number:

    rake release_start['2.1.0']

And another to finish the release:

    rake release_finish['A helpful tag message that will be included in the gemspec.']

This handles updating the change log, committing, and tagging the release.
