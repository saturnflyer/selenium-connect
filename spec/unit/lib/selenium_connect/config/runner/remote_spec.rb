# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/runner/remote'

describe SeleniumConnect::Config::Runner::Remote do

  it 'it should merge in sym => value pairs' do
    opts = {
      something: 'other',
    }
    config = SeleniumConnect::Config::Runner::Remote.new(opts)
    config.something.should eq 'other'
  end

end
