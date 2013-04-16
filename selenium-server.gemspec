Gem::Specification.new do |s|
  s.name          = 'selenium-server'
  s.version       = '0.2.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Dave Haeffner']
  s.email         = ['dave@arrgyle.com']
  s.homepage      = 'https://github.com/arrgyle/selenium-server'
  s.summary       = 'A wrapper and runner for the selenium-standalone-server jar file.'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9'

  s.add_dependency 'selenium-webdriver'
  s.add_dependency 'rake'
end
