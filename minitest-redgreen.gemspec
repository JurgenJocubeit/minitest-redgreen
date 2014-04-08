# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/redgreen/version'

Gem::Specification.new do |gem|
  gem.name          = "minitest-redgreen"
  gem.version       = Minitest::Redgreen::VERSION
  gem.authors       = ["Dom Jocubeit", "John Parker"]
  gem.email         = ["hello@meetdom.com", "jparker@urgetopunt.com"]
  gem.summary       = %q{Colorize and pluralize minitest test output.}
  gem.description   = %q{Colorize and pluralize minitest output: failing red, pending yellow, passing green and errors purple.}
  gem.homepage      = "https://github.com/MeetDom/minitest-redgreen"
  gem.platform      = Gem::Platform::RUBY
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'rake'
end
