# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/runner_factory'

describe SeleniumConnect::Runner::RunnerFactory do
  let(:factory) { SeleniumConnect::Runner::RunnerFactory }

  it 'should respond to build' do
    factory.should respond_to :build
  end

  it 'should raise an error for unknown runner' do
    config = double 'SeleniumConnect::Config::Runner::Local'
    config.should_receive(:type).and_return('bad_runner')
    expect do
      factory.build config
    end.to raise_error(ArgumentError, 'The runner "bad_runner" is unknown.')
  end

  it 'attempts to load non-standard runners' do
    randomly_generated_name = %w{ a b c d e f g }.sample(7).join
    runner_class_name = randomly_generated_name.sub(/^./){|letter| letter.upcase } + 'Runner'

    generated_runner_class = Class.new(SeleniumConnect::Runner::Base)

    SeleniumConnect::Runner.const_set(runner_class_name, generated_runner_class)

    config = double('SeleniumConnect::Config::Runner', type: randomly_generated_name, opts: {})

    expect do
      factory.build config
    end.to_not raise_error
  end

end
