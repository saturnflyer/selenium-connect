# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/local_job'
require 'selenium_connect/job/remote_job'
require 'selenium_connect/browser/firefox_browser'

describe 'job runner', selenium: true do

    it 'should run a firefox job locally' do
        job  = SeleniumConnect::Job::LocalJob.new.start(SeleniumConnect::Browser::FirefoxBrowser.new)
        execute_simple_test job.driver
        job.finish
    end

    it 'should run a firefox job via a local remote' do
       job  = SeleniumConnect::Job::RemoteJob.new.start(SeleniumConnect::Browser::FirefoxBrowser.new)
       execute_simple_test job.driver
       job.finish
    end
end
