require 'selenium-connect'

describe "YAML" do

  it 'setting config_file returns a proper config object' do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
    config = SeleniumConnect.debug_config
    config.class.should == SeleniumConnect::Configuration
    config.inspect.empty?.should == false
  end

  it 'chrome', :wip => true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

    it 'chrome', :wip => true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

    it 'chrome', :wip => true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end

    it 'chrome', :wip => true, selenium: true do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
    driver = SeleniumConnect.start
    driver.get 'http://google.com'
    SeleniumConnect.finish
  end
end
