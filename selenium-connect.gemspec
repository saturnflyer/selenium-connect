Gem::Specification.new do |s|
  s.name          = 'selenium-connect'
  s.version       = '3.1.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Dave Haeffner', 'Jason Fox']
  s.email         = ['dave@arrgyle.com', 'jason@arrgyle.com']
  s.homepage      = 'https://github.com/arrgyle/selenium-connect'
  s.summary       = 'A stupid simple way to run your Selenium tests on localhost, against a Selenium Grid, or in the cloud (e.g. SauceLabs).'
  s.description   = 'return the log file names in the report object'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9'

  s.add_dependency 'selenium-webdriver'
  s.add_dependency 'rake'
  s.add_dependency 'sauce', '~> 2.4.4'
  s.add_dependency 'sauce_whisk', '~> 0.0.8'
  s.add_dependency 'curb', '~> 0.8.4'

  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'rubocop', '~> 0.9.0'
  s.add_development_dependency 'guard-rspec', '~> 3.0.2'
  s.add_development_dependency 'coveralls', '~> 0.6.7'

end
