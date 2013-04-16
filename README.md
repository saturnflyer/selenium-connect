#selenium-server
===============

A wrapper for the [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html) -- used to download, start, stop, and restart selenium-standalone-server.jar.

## Getting Started
```ruby
require 'selenium-server'
SeleniumServer.start
SeleniumServer.restart
SeleniumServer.stop
```  

## Helpful bits
The start action will download the latest selenium-standalone-server.jar (unless it already has) and run it, backgrounded, with logging disabled.
