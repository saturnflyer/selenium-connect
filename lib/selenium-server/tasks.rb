require 'selenium/rake/server_task'

Selenium::Rake::ServerTask.new do |t|
  t.jar = '../../bin/selenium-server-standalone-2.31.0.jar'
end
