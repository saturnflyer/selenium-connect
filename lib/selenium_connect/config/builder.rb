# Encoding: utf-8

require 'selenium_connect/config/runner/builder'
require 'selenium_connect/config/default'
require 'selenium_connect/config/job'
require 'yaml'

module SeleniumConnect
  module Config
    module Builder
      module_function

      def build(opts = {})
        defaults = { runner: {}, job: {} }
        opts = defaults.merge opts
        runner = SeleniumConnect::Config::Runner::Builder.build(opts.delete :runner)
        job = SeleniumConnect::Config::Job.new(opts.delete :job)
        SeleniumConnect::Config::Default.new(runner, job, opts)
      end

      def build_from_file(path)
        build(symbolize_keys(YAML.load_file path))
      end

      def symbolize_keys(hash)
        hash.reduce({}) do |result, (key, value)|
          new_key = key.class == String ? key.to_sym : key
          new_value = value.class == Hash ? symbolize_keys(value) : value
          result[new_key] = new_value
          result
        end
      end

    end
  end
end
