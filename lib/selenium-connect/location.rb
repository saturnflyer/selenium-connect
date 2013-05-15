require 'selenium-connect/locations/localhost.rb'
require 'selenium-connect/locations/saucelabs.rb'
require 'selenium-connect/locations/no_location.rb'

module SeleniumConnect
  class Location
    attr_reader :config, :location, :server

    def initialize(config)
      @config = config
    end

    def execute
      get_location
      init_location
    end

    private

    def get_location
      @location = locations.find { |location| location.match? }
    end

    def locations
      localhost   = Localhost.new(config)
      saucelabs   = Saucelabs.new(config)
      no_location = NoLocation.new(config)

      locations = [ localhost, saucelabs, no_location ]
    end

    def init_location
      @server = location.execute
    end

  end #Location
end #SeleniumConnect
