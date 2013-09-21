# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/chrome_job'

describe SeleniumConnect::Job::ChromeJob do
  let(:job) { SeleniumConnect::Job::ChromeJob.new }

  it 'should respond to run' do
    job.should respond_to :run
  end

  it 'can be run locally' do
    job.should respond_to :run_with_local_runner
  end
end
