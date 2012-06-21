# -*- encoding: utf-8 -*-
require File.expand_path('../lib/email_spy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kurtis Rainbolt-Greene"]
  gem.email         = ["kurtisrainboltgreene@gmail.com"]
  gem.description   = %q{Opens up your Rails emails}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/krainboltgreene/email_spy"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "email_spy"
  gem.require_paths = ["lib"]
  gem.version       = EmailSpy::VERSION

  gem.add_runtime_dependency 'launchy'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mail'
end
