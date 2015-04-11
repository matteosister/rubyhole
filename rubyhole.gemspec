# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyhole/version'

Gem::Specification.new do |spec|
  spec.name          = "rubyhole"
  spec.version       = Rubyhole::VERSION
  spec.authors       = ["Matteo Giachino"]
  spec.email         = ["matteog@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{expose RabbitMQ messages to socket}
  spec.description   = %q{expose RabbitMQ messages to socket}
  spec.homepage      = "http://rubyhole.cypresslab.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "bunny", "~> 1.7"
  spec.add_runtime_dependency "em-websocket", "~> 0.5"
end
