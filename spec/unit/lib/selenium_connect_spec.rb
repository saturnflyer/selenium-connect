# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe SeleniumConnect do
  let(:sc) { SeleniumConnect }

  it 'should respond to run_job' do
    sc.should respond_to :start
  end
end
