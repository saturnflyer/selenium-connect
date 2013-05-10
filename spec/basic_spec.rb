require 'selenium-connect'

describe SeleniumConnect do
  context "Firefox" do
    let(:google) { Google.new(SeleniumConnect.start) }

    it "blank config" do
      SeleniumConnect.configure do end
      google.visit
      google.page_title.should include("Google")
      SeleniumConnect.finish
    end

    it "localhost" do
      SeleniumConnect.configure do |c|
        c.host  = "localhost"
      end
      google.visit
      google.page_title.should include("Google")
      SeleniumConnect.finish
    end

    it "profile name", :wip => true do
      pending "requires machine setup to run, and need a public example"
      SeleniumConnect.configure do |c|
        c.profile_name  = "YourProfileName"
      end
    end

    it "profile path", :wip => true do
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
