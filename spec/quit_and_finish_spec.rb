require 'selenium-connect'

describe "Quit and Finish", selenium: true do

  it "quit when already finished doesn't blow up" do
    SeleniumConnect.configure do |c| end
    @driver = SeleniumConnect.start
    @driver.quit
    SeleniumConnect.finish
  end

end
