require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :default => [:build]

desc 'Runs standard build activities.'
task :build => [:clean, :spec]

desc 'Removes the build directory.'
task :clean do
  FileUtils.rm_rf('build');
end

RSpec::Core::RakeTask.new(:spec)
