# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe SeleniumConnect, :system do
  let(:sc) { SeleniumConnect }

  it 'should run a basic job using default settings' do
    session = sc.start
    execute_simple_test session.driver
    session.finish
  end

end
