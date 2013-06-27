module SeleniumConnect
  class Server
    attr_reader :configuration, :current_dir_path

    def initialize(configuration)
      @configuration = configuration
      @current_dir_path = File.join(File.dirname(File.expand_path(__FILE__)))
    end

    def start
      rake "start"
    end

    def stop
      rake "stop"
    end

    def restart
      rake "restart"
    end

    private

    def generate_rake_task
      "require 'selenium/rake/server_task'

       Selenium::Rake::ServerTask.new(:server) do |t|
         #{
            if configuration.jar
              "t.jar = '#{configuration.jar}'"
            else
              "t.jar = '#{current_dir_path + '/../../bin/selenium-server-standalone-2.33.0.jar'}'"
            end
         }
         t.background
         #{
          if configuration.log
            "t.log = '#{File.join(Dir.getwd, configuration.log, 'server.log')}'"
          else
            "t.log = false"
          end
         }
         t.port = #{configuration.port}
         #{
            if configuration.browser == 'chrome'
              "t.opts = '-Dwebdriver.chrome.driver=#{current_dir_path + '/../../bin/chromedriver'}'"
            end
         }
       end"
    end

    def get_rake_file
      rake_file_path = current_dir_path + '/rake.task'
      rake_file = File.open(rake_file_path, 'w')
      rake_file << generate_rake_task
      rake_file.close
      return rake_file_path
    end

    def rake(task)
      system "rake -f #{get_rake_file} server:#{task}"
    end

  end #Server
end #SeleniumConnect
