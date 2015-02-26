# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/slack/rt/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-slack-rt"
  spec.version       = Ruboty::Slack::Rt::VERSION
  spec.authors       = ["Kazuki AKAMINE"]
  spec.email         = ["kazzone87@gmail.com"]
  spec.description   = %q{ruboty adapter for slack-realtime gem}
  spec.summary       = %q{ruboty adapter for slack-realtime gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty", ">= 1.0.4"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
