# Encoding: utf-8

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: :build_ci

task build_ci: [:clean, :prepare, :rubocop, :spec_unit]

desc 'Runs standard build activities.'
task build: [:clean, :prepare, :rubocop, :spec_unit, :spec]

desc 'Removes the build directory.'
task :clean do
  FileUtils.rm_rf('build')
end
desc 'Adds the build tmp directory for test kit creation.'
task :prepare do
  FileUtils.mkdir_p('build/tmp')
end
RSpec::Core::RakeTask.new(:spec_full)

RSpec::Core::RakeTask.new(:spec_unit) do |t|
  t.rspec_opts = "--tag ~selenium"
end

desc 'Runs code quality check'
task :rubocop do
  sh 'rubocop'
end
