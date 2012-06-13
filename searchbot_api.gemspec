# -*- encoding: utf-8 -*-
require File.expand_path('../lib/searchbot_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{A wrapper for chatbot service}
  gem.summary       = %q{A wrapper for chatbot service}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "searchbot_api"
  gem.require_paths = ["lib"]
  gem.version       = SearchbotApi::VERSION

  gem.add_runtime_dependency("faraday")
  gem.add_development_dependency("rspec")
end
