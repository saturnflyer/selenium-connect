module SeleniumServer
  module Server
    extend self

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

    def rake_file
      "#{File.join(File.dirname(File.expand_path(__FILE__)), 'rake.task')}"
    end

    def rake(task)
      system "rake -f #{rake_file} server:#{task}"
    end
  end
end
