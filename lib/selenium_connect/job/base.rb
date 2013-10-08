# Encoding: utf-8

module SeleniumConnect
  module Job
    class Base

      def initialize(config)
        @opts = config.opts
        @opts.delete :browser
      end

    end
  end
end

      # def slugify_name(name)
      #   name.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
      # end
