require 'thor'
require 'scaffold/subcommand/example'

module Scaffold
  # Implements a Thor based command-line interface for Scaffold.
  class Cli < Thor
    # Load the 'example' subcommand into the Cli scope.
    desc 'example [COMMAND]', 'example subcommands'
    subcommand 'example', Scaffold::Subcommand::Example

    # Implements the Cli 'version' command.
    # Params:
    desc 'version', 'Prints the version and exits'
    map %w[-v --version] => :version
    def version
      say "Scaffold v#{Scaffold::VERSION}"
    end
  end
end
