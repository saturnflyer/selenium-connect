# Encoding: utf-8

require 'yaml'

module SeleniumConnect
  class Configuration

    # Selenium Server
    attr_accessor :host, :port, :version,
                  :background, :log, :jar

    # Browsers
    attr_accessor :browser, :browser_path,
                  :profile_path, :profile_name

    # SauceLabs
    attr_accessor :sauce_username, :sauce_api_key,
                  :os, :browser_version, :description

    def initialize
      @host     = 'localhost'
      @port     = 4444
      @browser  = 'firefox'
    end

    def populate_with_hash(hash)
      hash.each do |key, value|
        self.send "#{key}=", value unless value.nil?
      end
    end

    def populate_with_yaml(file)
        populate_with_hash YAML.load_file file
    end

    alias_method :config_file=, :populate_with_yaml

  end # Configuration
end # SeleniumConnect
