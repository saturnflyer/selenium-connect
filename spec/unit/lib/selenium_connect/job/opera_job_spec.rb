# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/opera_job'

describe SeleniumConnect::Job::OperaJob do
  let(:job) do
    config = double 'SeleniumConnect::Config::Job'
    config.should_receive(:opts).and_return({})
    SeleniumConnect::Job::OperaJob.new config
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
