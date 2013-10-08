# Encoding: utf-8

module SeleniumConnect
  module Runner
    class Base

      attr_accessor :driver, :opts

      def initialize(config)
        @opts = config.opts
        @session = { runner_opts: @opts }.merge(assets: [])
        @log_dir = @opts.delete(:log_dir)
      end

      def finish(opts = {})
        @session[:finish_opts] = opts
        before_driver_quit opts
        @driver.quit
        after_driver_quit opts
        symbolize_keys(@session)
      end

      protected

        def before_driver_quit(opts)
          save_screenshot
          save_dom_html
        end

        def after_driver_quit(opts)
          save_asset('session.json') { @session.to_json }
        end

        def save_screenshot
          path = File.join(log_path, 'failshot.png')
          record_asset path
          @driver.save_screenshot path
        end

        def save_dom_html
          dom_number = 0
          @driver.window_handles.each do |handle|
            @driver.switch_to.window(handle)
            save_asset("dom_#{dom_number}.html") { @driver.page_source }
            dom_number += 1
          end
        end

      def save_asset(filename)
        if @log_dir
          asset = yield
          if asset
            asset_file = File.join(log_path, filename)
            record_asset asset_file
            File.open(asset_file, 'w') { |f| f.write asset }
          end
        end
      end

      def record_asset(filename)
        @session[:assets] << filename
      end

      def log_path
        File.join(Dir.getwd, @log_dir) if @log_dir
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
