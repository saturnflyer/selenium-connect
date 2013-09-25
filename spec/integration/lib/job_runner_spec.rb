# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/firefox_job'
require 'selenium_connect/runner/local_runner'

describe 'job runner', selenium: true do

  it 'should run a firefox job locally', :system do
    job  = SeleniumConnect::Runner::LocalRunner.new.run(SeleniumConnect::Job::FirefoxJob.new)
    execute_simple_test job.driver
    job.finish
  end

    # it 'should run a firefox job via a local remote' do
    #    job  = SeleniumConnect::Job::RemoteJob.new.start(SeleniumConnect::Browser::FirefoxBrowser.new)
    #    execute_simple_test job.driver
    #    job.finish
    # end
end
