# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hapi/version'

Gem::Specification.new do |spec|
  spec.name          = "hapi"
  spec.version       = Hapi::VERSION
  spec.authors       = ["Brad Chase"]
  spec.email         = ["brad@webappfromscratch.com"]
  spec.summary       = %q{Quickly build Ruby clients for RESTful HTTP APIs}
  spec.description   = %q{Quickly build Ruby clients for RESTful HTTP APIs}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "fetching"
end
