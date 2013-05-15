require 'selenium-connect'

describe "Acceptance Tests" do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:driver)  { SeleniumConnect.start }
  let(:quit)    { SeleniumConnect.finish }

  context "Common" do
    it "logging" do
      SeleniumConnect.configure do |c|
        c.log = "#{Dir.pwd}/runner.out"
      end
      google.visit
      SeleniumConnect.finish
      log = File.read('runner.out')
      log.empty?.should == false
      File.delete('runner.out')
    end
  end

  context "Firefox" do
    it "blank config" do
      SeleniumConnect.configure do end
      google.visit
      google.page_title.should include("Google")
      quit
    end

    it "localhost", :wip => true do
      SeleniumConnect.configure do |c|
        c.host  = "localhost"
      end
      google.visit
      google.page_title.should include("Google")
      quit
    end

    it "local jar file" do
      SeleniumConnect.configure do |c|
        c.host  = "localhost"
        c.jar   = "#{Dir.pwd}/selenium-server-standalone-2.32.0.jar"
      end
      google.visit
      google.page_title.should include("Google")
      quit
    end

    it "profile name" do
      pending "requires machine setup to run, and need a public example"
      SeleniumConnect.configure do |c|
        c.profile_name  = "YourProfileNameGoesHere"
      end
    end

    it "profile path" do
      pending "need to add a profile to the repo"
      SeleniumConnect.configure do |c|
        c.profile_path  = "#{Dir.pwd}/path/to/profile"
      end
    end

    it "browser path" do
      #only works with Firefox
      SeleniumConnect.configure do |c|
        c.host  = "localhost"
        c.jar   = "#{Dir.pwd}/selenium-server-standalone-2.32.0.jar"
        c.browser = "firefox"
        c.browser_path = "/Applications/Firefox.app/Contents/MacOS/firefox"
      end
      google.visit
      google.page_title.should include("Google")
      quit
    end

  end #Context//Firefox

  context "IE" do

    it "grid" do
      pending
      SeleniumConnect.configure do |c|
#        c.host = "at-xp1.dodiis-aspace.local"
        c.host = "192.168.1.139"
        c.browser = "ie"
      end
      driver.get 'https://mashup.ic.mantech.com/ispace'
      quit
    end

  end #Context//IE

end #Describe

class Google
  attr_accessor :page

  def initialize(driver)
    @page = driver
  end

  def visit
    page.get "http://www.google.com"
  end

  def page_title
    page.title
  end
end
