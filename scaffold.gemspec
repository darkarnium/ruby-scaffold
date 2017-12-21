# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Load the version directly from the source tree.
require 'scaffold/version'

Gem::Specification.new do |spec|
  spec.name = 'Scaffold'
  spec.version = Scaffold::VERSION
  spec.authors = ['Peter Adkins']
  spec.email = ['peter.adkins@kernelpicnic.net']

  spec.summary = 'Implements a basic scaffold for Ruby tools'
  spec.description = '...'
  spec.homepage = 'http://www.kernelpicnic.net'

  spec.files = Dir['*.md', 'bin/*', 'lib/**/*.rb']
  spec.executables = 'scaffold'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '= 0.20.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
end
