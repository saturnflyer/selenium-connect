# Encoding: utf-8

require_relative 'example_page_object'

def execute_simple_test(driver)
  google = ExamplePageObject.new driver
  google.visit
  google.page_title.should include('Google')
end

def log_file_exists?(file)
  path = File.join(ENV['BUILD_PATH'], 'tmp', file)
  File.exist?(path).should be_true
end
