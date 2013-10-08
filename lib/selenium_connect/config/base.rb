# Encoding: utf-8

module SeleniumConnect
  module Config
    class Base

      def initialize(opts = {})
        opts = {} if opts.nil?
        @opts = defaults.merge(opts)
      end

      def method_missing(name)
        @opts[name.to_sym]
        rescue
          raise ArgumentError, 'Property not found for ' + name
      end

      def type
        fail Exception, 'Runner type must be defined in child class!'
      end

      protected

        def defaults
          {}
        end

    end
  end
end
