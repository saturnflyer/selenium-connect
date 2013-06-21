require 'selenium-connect'
require_relative 'helper'

describe "Logging" do
  let(:google)    { Google.new(SeleniumConnect.start) }
  let(:log_dir)  { File.join(Dir.pwd, 'build') }

  before(:all) do
    SeleniumConnect.configure do |c|
      c.log = log_dir
    end

    google.visit
    SeleniumConnect.finish
  end

  it "server" do
    server_log = File.read(log_dir+'/server.log')
    server_log.empty?.should be false
  end

  it "browser" do
    browser_log = File.read(log_dir+'/firefox.log')
    browser_log.empty?.should be false
  end
end
