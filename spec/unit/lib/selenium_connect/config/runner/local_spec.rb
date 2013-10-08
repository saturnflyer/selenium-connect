# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/runner/local'

describe SeleniumConnect::Config::Runner::Local do

  it 'should merge in sym => value pairs' do
    opts = {
      something: 'other',
    }
    config = SeleniumConnect::Config::Runner::Local.new(opts)
    config.something.should eq 'other'
  end

end
