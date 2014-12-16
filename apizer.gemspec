# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apizer/version'

Gem::Specification.new do |spec|
  spec.name          = "apizer"
  spec.version       = Apizer::VERSION
  spec.authors       = ["Salvatore Piazzolla"]
  spec.email         = ["piazz23@gmail.com"]
  spec.summary       = %q{API builder}
  spec.description   = %q{API builder gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0"
  spec.add_dependency "activesupport", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
