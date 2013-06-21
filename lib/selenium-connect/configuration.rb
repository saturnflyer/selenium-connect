module SeleniumConnect
  class Configuration
    #Selenium Server
    attr_accessor :host, :port, :version,
                  :background, :log, :jar

    #Browsers
    attr_accessor :browser, :browser_path,
                  :profile_path, :profile_name

    #SauceLabs
    attr_accessor :sauce_username, :sauce_api_key,
                  :os, :browser_version, :description

    def config_file=(file)
      set_config_values_from_file(get_config_values_from_file(file))
    end

    private

    def initialize
      defaults
    end

    def defaults
      @host     = 'localhost' unless host
      @port     = 4444        unless port
      @browser  = 'firefox'   unless browser
    end

    def get_config_values_from_file(file)
      require 'yaml'
      YAML.load_file(file)
    end

    def set_config_values_from_file(config_file_values)
      config_file_values.each do |config_parameter, config_value|
        instance_variable_set("@#{config_parameter}", config_value)
      end
      defaults
    end

  end #Configuration
end #SeleniumConnect
