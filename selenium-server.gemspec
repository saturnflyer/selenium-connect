Gem::Specification.new do |s|
  s.name          = 'selenium-server'
  s.version       = '1.2.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Dave Haeffner']
  s.email         = ['dave@arrgyle.com']
  s.homepage      = 'https://github.com/arrgyle/selenium-server'
  s.summary       = 'A configurator and runner for your Selenium tests against a Selenium Server.'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9'

  s.add_dependency 'selenium-webdriver'
  s.add_dependency 'rake'
end
