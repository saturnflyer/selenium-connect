# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/phantom_job'

describe SeleniumConnect::Job::PhantomJob do
  let(:job) do
    config = double 'SeleniumConnect::Config::Job'
    SeleniumConnect::Job::PhantomJob.new config
  end

  it 'can be run locally' do
    job.should respond_to :run_with_local_runner
  end
end
