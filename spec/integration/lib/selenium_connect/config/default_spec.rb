# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/default'
require 'selenium_connect/config/job'
require 'selenium_connect/config/runner/local'

describe SeleniumConnect::Config::Default do

  let(:config) do
    runner = SeleniumConnect::Config::Runner::Local.new
    job = SeleniumConnect::Config::Job.new
    SeleniumConnect::Config::Default.new runner, job
  end

  it 'should return default options' do
    config.log_dir.should eq '/tmp'
  end

end
