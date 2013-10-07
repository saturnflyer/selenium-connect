# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/safari_job'

describe SeleniumConnect::Job::SafariJob do
  let(:job) do
    config = double 'SeleniumConnect::Config::Job'
    SeleniumConnect::Job::SafariJob.new config
  end

  it 'should respond to run' do
    job.should respond_to :run
  end

  it 'can be run locally' do
    job.should respond_to :run_with_local_runner
  end

  it 'can be run remotely' do
    job.should respond_to :run_with_remote_runner
  end

  it 'can be run with sauce' do
    job.should respond_to :run_with_sauce_runner
  end
end
