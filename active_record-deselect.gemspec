# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/deselect/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record-deselect"
  spec.version       = ActiveRecord::Deselect::VERSION
  spec.authors       = ["fukayatsu"]
  spec.email         = ["fukayatsu@gmail.com"]
  spec.description   = %q{Adds deselect logic to ActiveRecord}
  spec.summary       = %q{Adds deselect logic to ActiveRecord}
  spec.homepage      = "https://github.com/fukayatsu/active_record-deselect"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '> 3.0.0'
  spec.add_development_dependency "bundler", "> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "sqlite3"
end
