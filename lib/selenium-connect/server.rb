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
         #{"t.version = :latest" unless configuration.jar}
         #{if configuration.jar then "t.jar = '#{configuration.jar}'" end}
         t.background
         t.log = #{configuration.log ? configuration.log : "false"}
         t.port = #{configuration.port ? configuration.port : "4444"}
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
