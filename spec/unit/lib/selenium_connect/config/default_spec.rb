# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/default'

describe SeleniumConnect::Config::Default do

  let(:config) do
    runner = double 'SeleniumConnect::Config::Runner::Local'
    job = double 'SeleniumConnect::Config::Job'
    SeleniumConnect::Config::Default.new runner, job
  end

  it 'should return default options' do
    config.log_dir.should eq '/tmp'
  end

end
