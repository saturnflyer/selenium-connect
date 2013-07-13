# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe 'Quit and Finish', selenium: true do

  it 'quit when already finished doesn\'t blow up' do
    SeleniumConnect.configure {}
    @driver = SeleniumConnect.start
    @driver.quit
    SeleniumConnect.finish
  end

end
