# Encoding: utf-8

require 'selenium_connect/runner/base'

module SeleniumConnect
  # encapsulates the creation of a driver and a run
  module Runner
    class RemoteRunner < Base

      def run(job)
        begin
          @driver = job.run_with_remote_runner(self)
        rescue NoMethodError
          raise ArgumentError, "At the moment, SeleniumConnect does not support running \"#{job.class.name.split('::').last}\" with \"#{self.class.name.split('::').last}.\""
        end
        self
      end

    end
  end
end

# Encoding: utf-8

# require "selenium-webdriver"
# require 'selenium/server'

# class SeleniumConnect
#   # encapsulates the creation of a driver and a run
#   class Job
#     class RemoteJob

#       attr_reader :driver

#       def initialize
#           @server = Selenium::Server.new(
#             File.join(Dir.getwd,'bin', 'selenium-server-standalone-2.35.0.jar'),
#             background: true,
#             log: '/tmp/test-ses.log'
#             )
#           @server.start
#       end

#       def start(browser)
#         browser.start_dispatch(self)
#       end

#       def start_with_firefox(firefox_browser)
#         @driver = Selenium::WebDriver.for(
#           :remote,
#           url: 'http://127.0.0.1:4444/wd/hub'
#         )
#         self
#       end

#       def finish
#         @driver.quit
#         @server.stop
#       end

#     end
#   end
# end

 # def get_rake_file
 #        rake_file_path = current_dir_path + '/rake.task'
 #        File.open(rake_file_path, 'w') do |file|
 #          file.puts "require 'selenium/rake/server_task'"
 #          file.puts 'Selenium::Rake::ServerTask.new(:server) do |t|'
 #          if configuration.jar
 #            file.puts "t.jar = '#{configuration.jar}'"
 #          else
 #            file.puts "t.jar = '#{current_dir_path + '/../../bin/selenium-server-standalone-2.35.0.jar'}'"
 #          end
 #          file.puts 't.background'
 #          if configuration.log
 #            file.puts "t.log = '#{File.join(Dir.getwd, configuration.log, 'server.log')}'"
 #          else
 #            file.puts 't.log = false'
 #          end
 #          file.puts "t.port = #{configuration.port}"
 #          opts = ''
 #          if configuration.browser == 'chrome'
 #            opts += '-Dwebdriver.chrome.driver=' + current_dir_path + '/../../bin/chromedriver'
 #            if configuration.log
 #              opts += ' -Dwebdriver.chrome.logfile=' + File.join(Dir.getwd, configuration.log, 'chrome.log')
 #            end
 #            file.puts "t.opts = %w[#{opts}]"
 #          end
 #          file.puts 'end'
 #        end
 #          rake_file_path
 #      end
