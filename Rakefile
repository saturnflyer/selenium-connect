require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :default => [:build]

desc 'Runs standard build activities.'
task :build => [:clean, :spec]

desc 'Removes the build directory.'
task :clean do
  FileUtils.rm_rf('build');
end
desc 'Adds the build tmp directory for test kit creation.'
task :prepare do
  FileUtils.mkdir_p('build/tmp')
end
RSpec::Core::RakeTask.new(:spec)
