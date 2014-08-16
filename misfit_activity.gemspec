# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'misfit_activity/version'

Gem::Specification.new do |spec|
  spec.name          = "misfit_activity"
  spec.version       = MisfitActivity::VERSION
  spec.authors       = ["John Contreras"]
  spec.email         = ["contrerasnet@gmail.com"]
  spec.summary       = %q{Misfit api client for activities.}
  spec.description   = %q{Misfit api client for activities only, profile, device and activities by date/range.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
