# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/ie_job'

describe SeleniumConnect::Job::IeJob do
  let(:job) { SeleniumConnect::Job::IeJob.new }

  it 'should respond to run' do
    job.should respond_to :run
  end

  it 'can be run with sauce' do
    job.should respond_to :run_with_sauce_runner
  end
end
