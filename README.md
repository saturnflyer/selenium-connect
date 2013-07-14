#selenium-connect 3.1.1 (2013-07-14)

[![Gem Version](https://badge.fury.io/rb/selenium-connect.png)](http://badge.fury.io/rb/selenium-connect) [![Build Status](https://travis-ci.org/arrgyle/selenium-connect.png?branch=develop)](https://travis-ci.org/arrgyle/selenium-connect) [![Code Climate](https://codeclimate.com/github/arrgyle/selenium-connect.png)](https://codeclimate.com/github/arrgyle/selenium-connect) [![Coverage Status](https://coveralls.io/repos/arrgyle/selenium-connect/badge.png?branch=develop)](https://coveralls.io/r/arrgyle/selenium-connect?branch=develop)

A stupid simple way to run your Selenium tests on your computer, against a Selenium Grid, or in the cloud (e.g. SauceLabs). For a rocking implementation of this library, checkout [ChemistryKit](https://github.com/arrgyle/chemistrykit)!

All the documentation for Selenium Connect can be found in this README, organized as follows:

- [Getting Started](#getting-started)
- [Helpful Bits](#helpful-bits)
- [Configuration](#configuration)
- [Contribution Guidelines](#contribution-guidelines)
- [Deployment](#deployment)

## Getting Started
```ruby
require 'selenium-connect'

# generate a config object
config = SeleniumConnect::Configuration.new browser: 'firefox'

# get connected
sc = SeleniumConnect.start config

# create a job
job = sc.create_job

# start the job to get a driver
@driver = job.start

# get on the road!
@driver = SeleniumConnect.start
@driver.get "http://www.google.com"

# finish your job
job.finish

# go have some fun!
sc.finish

## Helpful Bits

### Start
If host is set to "localhost" and no jar file is specified, it will run the version of [selenium-standalone-server.jar](https://code.google.com/p/selenium/downloads/list) that is bundled with the library (currently 2.33.0). Or, you can specify your own jar if you have one you prefer to use. This is done with c.jar = 'path-to-jar-file'.

If no additional parameters are set, the Selenium Server will be run in the background with logging disabled. If a logging directory is provided (with c.log = 'path-to-log-dir') then 2 output files will be generated:
+ Selenium Server JSON Wire Protocol output (server.log)
+ Browser output (browser.log) -- currently only available for Firefox

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
Configuration of Selenium Connect is SUPER SIMPLE if you want it to be:

    config = SeleniumConnect::Configuration.new

By default it will run a local instance of selenium server on port 4444 and launch firefox. Get going without a whole bunch of shenanigans.

If however you want to install custom settings you can use any of the following:

```YAML
# Setup & Debugging
jar: # this is where my selenium server jar is
log: # the logs go to this folder

# Where to run your tests
host: 'localhost' # local, a grid ip or "saucelabs"
port:

# Browser
browser:      'firefox'
browser_path:
profile_path:
profile_name:

# Saucelabs
os:
sauce_username: 'test_user_name'
sauce_api_key:
browser_version:
description: #sauce job/test description
```

You can pass parameters into the new config object like:

    config = SeleniumConnect::Configuration.new host: 'sauce labs', log: 'build'

Or you can load them up from a YAML file:

    config = SeleniumConnect::Configuration.new.populate_with_yaml '/my/config.yaml'


###Additional Configuration
When you create your job you can pass in parameters, right now just `:name` that lets you configure a job at runtime. This is helpful for using Sauce Labs where you'd want to update the description to whatever test job you are running:


```Ruby
#…
job.start name: 'website should load'
#…
```

Similarly, when you finish your job you can pass in parameters. Right now this is limited to sauce labs jobs, as it lets you mark the tests as passed, failed, and turn on downloading the failure screenshot:

```Ruby
# sweet your test passed!
report = job.finish passed: true

# shucks your test failed :(
report = job.finish failed: true, failshot: true
```

The `report` is simply a container for arbitrary data. Right now we are passing back the sauce details. Here is an example of `report.data` for a failed job:

```
{:failshot=>"failed_e8ebfe9fc5004df7865b6a6f9f1f5491.png", :server_log=>"sauce_job_e8ebfe9fc5004df7865b6a6f9f1f5491.log", :sauce_data=>{:id=>"e8ebfe9fc5004df7865b6a6f9f1f5491", :"custom-data"=>nil, :owner=>"testing_arrgyle", :status=>"complete", :error=>nil, :name=>"failshot", :browser=>"iexplore", :browser_version=>"7.0.5730.13", :os=>"Windows 2003", :creation_time=>1373831090, :start_time=>1373831090, :end_time=>1373831105, :video_url=>"http://saucelabs.com/jobs/e8ebfe9fc5004df7865b6a6f9f1f5491/video.flv", :log_url=>"http://saucelabs.com/jobs/e8ebfe9fc5004df7865b6a6f9f1f5491/selenium-server.log", :public=>nil, :tags=>[], :passed=>false}}
```

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
