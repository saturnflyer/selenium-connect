# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/default'

describe SeleniumConnect::Config::Default do

  let(:config) { SeleniumConnect::Config::Default.new }

  it 'should return default options' do
    config.log_dir.should eq '/tmp'
  end

end
