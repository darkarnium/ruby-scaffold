require 'logger'

module Net
  module KernelPicnic
    module Common
      # Provides an extended Ruby logger to provide a default logging class, with a default log
      # retention and output format.
      class Log < Logger
        # Initialize the parent log object.
        # Params:
        def initialize
          @level = INFO

          # Set the default formatter.
          @formatter = proc do |severity, datetime, _progname, msg|
            iso8601_format = datetime.strftime('%Y-%m-%dT%H:%M:%S%:z')
            "[#{iso8601_format}] #{severity}: #{msg}\n"
          end
        end

        # Set the log destination.
        # Params:
        # +output+:: Requested log destination (STDOUT, or filepath).
        def destination(output)
          raise 'No log destination provided' unless output

          @logdev = output.casecmp('STDOUT') == 0 ? Logger::LogDevice.new(STDOUT) : Logger::LogDevice.new(output)
        end

        # Set the log level.
        # Params:
        # +level+:: Requested log level (supports all Ruby Logger levels).
        def level(level)
          raise 'No log level provided' unless level
          @level = level
        end
      end
    end
  end
end
