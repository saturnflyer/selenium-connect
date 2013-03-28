require 'selenium/rake/server_task'

bin_dir = File.join(File.dirname(File.expand_path(__FILE__)), 'bin/')

Selenium::Rake::ServerTask.new do |t|
  t.jar = "#{bin_dir}selenium-server-standalone-2.31.0.jar"
  t.log = false
  t.background
end
