require 'selenium-connect'

describe "Acceptance Tests" do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:driver)  { SeleniumConnect.start }
  let(:quit)    { SeleniumConnect.finish }

  context "Common" do
    it "logging", :wip => true do
      SeleniumConnect.configure do |c|
        c.log = "#{Dir.pwd}/runner.out"
      end
      google.visit
      SeleniumConnect.finish
      File.read('runner.out').empty?.should == false
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

    it "localhost" do
      SeleniumConnect.configure do |c|
        c.host  = "localhost"
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

  end #Context//Firefox
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
    page.getTitle
  end
end
