# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/job_factory'

describe SeleniumConnect::Job::JobFactory do
  let(:factory) { SeleniumConnect::Job::JobFactory }

  it 'should respond to build' do
    factory.should respond_to :build
  end

  it 'should raise an error for unknown job' do
    expect do
      factory.build browser: 'bad_job'
    end.to raise_error(ArgumentError, 'The job "bad_job" is unknown.')
  end

end
