require 'thor'

module Scaffold
  class Subcommand
    # Implements 'example' sub-command functionality inside of the Cli.
    class Example < Thor
      class_option :log_file, type: :string, default: 'STDOUT'
      class_option :config_file, type: :string, default: '/tmp/scaffold.yaml'

      # Implements 'example' -> 'execute' functionality for the Cli.
      # Params:
      desc 'execute', 'Executes an example'
      def execute
        logger = Scaffold::Log.new(destination: options[:log_file])

        # Load the specified configuration file.
        logger.info("Loading configuration from #{options[:config_file]}")
        _ = Scaffold::Config.new(file: options[:config_file])
        logger.info('Configuration loaded')
      end
    end
  end
end
