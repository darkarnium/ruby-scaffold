require 'logger'

module Scaffold
  # Provides an extended Ruby logger to provide a default logging class, with a
  # default log retention and output format.
  class Log < Logger
    # Initialize the parent log object.
    # Params:
    # +destination+:: The log destination (file, or STDOUT).
    def initialize(destination = 'STDOUT')
      @level = INFO

      # Set the default formatter.
      @formatter = proc do |severity, datetime, _progname, msg|
        iso8601_format = datetime.strftime('%Y-%m-%dT%H:%M:%S%:z')
        "[#{iso8601_format}] #{severity}: #{msg}\n"
      end

      # Set the log output destination.
      output(destination)
    end

    # Set the log destination.
    # Params:
    # +output+:: Requested log destination (STDOUT, or filepath).
    def output(output)
      raise 'No log destination provided' unless output

      if output.casecmp('STDOUT').zero?
        @logdev = Logger::LogDevice.new(STDOUT)
      else
        @logdev = Logger::LogDevice.new(output)
      end
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
