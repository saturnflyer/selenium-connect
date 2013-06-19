require 'selenium-connect'
require_relative 'helper'

describe "Logging" do
  let(:google)    { Google.new(SeleniumConnect.start) }
  let(:logs_dir)  { File.join(Dir.pwd, 'build') }

  it "logging" do
    SeleniumConnect.configure do |c|
      c.log = logs_dir
    end

    google.visit
    SeleniumConnect.finish

    server_log = File.read(logs_dir+'/server.log')
    server_log.empty?.should be false

    browser_log = File.read(logs_dir+'/firefox.log')
    browser_log.empty?.should be false

#    File.delete('runner.out')
  end
end
