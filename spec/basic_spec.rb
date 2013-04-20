require 'selenium-connect'

describe SeleniumConnect do

  it "standard configuration" do
    SeleniumConnect.configure do |c|
      c.host          = "localhost"
      c.port          = "4444"
    end

    @driver = SeleniumConnect.start

    @driver.get "http://www.google.com"

    @driver.getTitle.should include("Google")

    SeleniumConnect.finish
  end

end
