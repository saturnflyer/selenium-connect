# Encoding: utf-8

require 'selenium_connect/job/base'
require 'selenium-webdriver'
require 'sauce'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Job
    class FirefoxJob < Base

      def run_with_local_runner(runner)
        runner.driver = Selenium::WebDriver.for :firefox
      end

      def run_with_sauce_runner(runner)
        runner.opts.merge!(@opts)
      end

      def run_with_remote_runner(runner)
        runner.driver = Selenium::WebDriver.for(:remote)
      end
    end
  end
end

      # def get_profile
      #   if config.profile_path
      #     Selenium::WebDriver::Firefox::Profile.new config.profile_path
      #   elsif config.profile_name
      #     Selenium::WebDriver::Firefox::Profile.from_name config.profile_name
      #   else
      #     Selenium::WebDriver::Firefox::Profile.new
      #   end
      # end

      # def config_browser
      #   profile = get_profile
      #   profile.assume_untrusted_certificate_issuer = false unless profile.nil?
      #   profile.log_file = File.join(Dir.getwd, config.log, 'firefox.log') if config.log
      #   browser = Selenium::WebDriver::Remote::Capabilities.firefox
      #   browser[:firefox_binary] = config.browser_path if config.browser_path
      #   browser[:firefox_profile] = profile
      #   browser
      # end
