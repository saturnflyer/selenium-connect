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

  it 'should return the phantomjs binary path' do
    klass.new.binary_path('phantomjs').should eq File.join(Dir.pwd, 'bin', 'phantomjs')
  end

  it 'should return the selenium server binary' do
    klass.new.binary_path('selenium').should eq File.join(Dir.pwd, 'bin', 'selenium-server-standalone-2.34.0.jar')
  end

  it 'should raise and exception for unknown binary' do
    expect do
      klass.new.binary_path('bad_binary')
    end.to raise_error(ArgumentError, 'Unknown binary: "bad_binary"')
  end
end
