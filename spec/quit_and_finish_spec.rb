# Encoding: utf-8

require 'selenium-connect'

describe 'Quit and Finish', selenium: true do

  it 'quit when already finished doesn\'t blow up' do
    SeleniumConnect.configure {}
    @driver = SeleniumConnect.start
    @driver.quit
    SeleniumConnect.finish
  end

end
