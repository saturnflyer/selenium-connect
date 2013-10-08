# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/job_factory'
require 'selenium_connect/config/job'

describe SeleniumConnect::Job::JobFactory do
  let(:factory) { SeleniumConnect::Job::JobFactory }

  it 'should instantiate a firefox job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'firefox')
    job.should be_an_instance_of SeleniumConnect::Job::FirefoxJob
  end

  it 'should instantiate a chrome job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'chrome')
    job.should be_an_instance_of SeleniumConnect::Job::ChromeJob
  end

  it 'should instantiate a phantom job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'phantom')
    job.should be_an_instance_of SeleniumConnect::Job::PhantomJob
  end

  it 'should instantiate an ie job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'ie')
    job.should be_an_instance_of SeleniumConnect::Job::IeJob
  end

  it 'should instantiate a safari job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'safari')
    job.should be_an_instance_of SeleniumConnect::Job::SafariJob
  end

  it 'should instantiate a opera job' do
    job = factory.build SeleniumConnect::Config::Job.new(browser: 'opera')
    job.should be_an_instance_of SeleniumConnect::Job::OperaJob
  end
end
