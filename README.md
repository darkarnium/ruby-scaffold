# Ruby Scaffold

This repository contains a Ruby project scaffold for use when building various tooling. It has been built while creating automation tooling for use in environments where Ruby is already available - such as those which heavily utilise Chef.

This is essentially a variation of the output from a generic `bundle gem ...` run with a few additional components for quick-start.

## Thor

In order to simplify command-line operation and provide a rich featureset, `Thor` has been used.

## Configuration Support

Configuration files is supported out of the box in YAML format. An example configuration file has been included under `spec/fixtures/configuration.yaml`, which can be modified as appropriate.

## Logging

Logging is handled via the built-in Ruby `Logger`. However, in order to simplify configuration of this logger and to allow for users to get started quickly `Scaffold::Log` implements a pre-formatted, `STDOUT` writing logger for use in Thor commands, sub-commands and otherwise.
