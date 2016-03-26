# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'Scaffold'
  spec.version = '0.0.1'
  spec.authors = ['Peter Adkins']
  spec.email = ['peter.adkins@kernelpicnic.net']
  spec.summary = 'Implements a basic scaffold for Ruby libraries or services'
  spec.description = '...'
  spec.homepage = 'http://www.kernelpicnic.net'

  spec.files = [
    # Scaffold dependency loader.
    'lib/scaffold.rb',

    # Common.
    'net/kernelpicnic/common/debug',
    'net/kernelpicnic/common/log',
    'net/kernelpicnic/common/config',
    'net/kernelpicnic/common/daemon',
    'net/kernelpicnic/common/optionparser',

    # Scaffold Versioning.
    'net/kernelpicnic/scaffold/version',

    # Scaffold Command-line Argument Parsers.
    'net/kernelpicnic/scaffold/optionparser/general',
    'net/kernelpicnic/scaffold/optionparser/install',

    # Scaffold Service.
    'net/kernelpicnic/scaffold/service/install'

  ]
  spec.test_files = [
    # 'tests/test_NAME.rb'
  ]
  spec.executables = [
    'bin/scaffold',
    'bin/install'
  ]
  spec.require_paths = [
    'lib'
  ]
end
