# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/job/binary_aware'

describe SeleniumConnect::Job::BinaryAware do
  let(:klass) do
    Class.new do
      include SeleniumConnect::Job::BinaryAware
    end
  end

  it 'should respond to binary_path' do
    klass.new.should respond_to :binary_path
  end

  it 'should return the chromedriver binary path' do
    klass.new.binary_path('chromedriver').should eq File.join(Dir.pwd, 'bin', 'chromedriver')
  end
end
