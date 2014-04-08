# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/job_factory'

describe SeleniumConnect::Job::JobFactory do
  let(:factory) { SeleniumConnect::Job::JobFactory }

  it 'should respond to build' do
    factory.should respond_to :build
  end

  it 'should raise an error for unknown job' do
    config = double 'SeleniumConnect::Config::Job'
    config.should_receive(:browser).and_return('bad_job')
    expect do
      factory.build config
    end.to raise_error(ArgumentError, 'The job "bad_job" is unknown.')
  end

  it 'attempts to load non-standard jobs' do
    randomly_generated_name = %w{ a b c d e f g }.sample(7).join
    job_class_name = randomly_generated_name.sub(/^./){|letter| letter.upcase } + 'Job'

    generated_job_class = Class.new(SeleniumConnect::Job::Base)

    SeleniumConnect::Job.const_set(job_class_name, generated_job_class)

    config = double('SeleniumConnect::Config::Job', browser: randomly_generated_name, opts: {})

    expect do
      factory.build config
    end.to_not raise_error
  end
end
