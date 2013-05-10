module SeleniumConnect
  class Server
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
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
              "t.version = :latest"
            end
          }
         t.background
         t.log = '#{configuration.log}'
         t.port = #{configuration.port}
       end"
    end

    def get_rake_file
      rake_file = File.join(File.dirname(File.expand_path(__FILE__)))
      file = File.open(rake_file<<"/rake.task", "w")
      file << generate_rake_task
      file.close
      return rake_file
    end

    def rake(task)
      system "rake -f #{get_rake_file} server:#{task}"
    end
  end
end
