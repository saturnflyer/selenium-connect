# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/config/builder'

describe SeleniumConnect::Config::Builder do

  it 'should return a default configuration' do
    config = SeleniumConnect::Config::Builder.build
    config.runner.should be_an_instance_of SeleniumConnect::Config::Runner::Local
    config.job.should be_an_instance_of SeleniumConnect::Config::Job
    config.runner.type.should eq 'local'
    config.job.browser.should eq 'firefox'
  end

  it 'should return a fancy configuration' do
    opts = {
      runner: {
        type: 'sauce',
        options: {
          username: 'user',
          log_dir: ENV['LOG_PATH']
        }
      },
      job: {
        browser: 'safari'
      }
    }
    verify_fancy_confg SeleniumConnect::Config::Builder.build(opts)
  end

  it 'should load a config from yaml' do
    verify_fancy_confg SeleniumConnect::Config::Builder.build_from_file(File.join(ENV['SUPPORT_PATH'], 'config.yaml'))
  end

  def verify_fancy_confg(config)
    config.runner.should be_an_instance_of SeleniumConnect::Config::Runner::Sauce
    config.job.should be_an_instance_of SeleniumConnect::Config::Job
    config.runner.type.should eq 'sauce'
    config.job.browser.should eq 'safari'
    config.runner.username.should eq 'user'
    config.runner.log_dir.should eq ENV['LOG_PATH']
  end

end
