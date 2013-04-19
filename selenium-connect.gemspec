Gem::Specification.new do |s|
  s.name          = 'selenium-connect'
  s.version       = '1.2.1'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Dave Haeffner']
  s.email         = ['dave@arrgyle.com']
  s.homepage      = 'https://github.com/arrgyle/selenium-connect'
  s.summary       = 'A configurator and runner for your Selenium tests against local and remote Selenium Servers.'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9'

  s.add_dependency 'selenium-webdriver'
  s.add_dependency 'rake'
end
