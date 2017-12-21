require 'logger'

module Scaffold
  # Provides an extended Ruby logger to provide a default logging class, with a
  # default log retention and output format.
  class Log < Logger
    attr_writer :level

    # Initialize the parent log object.
    # Params:
    # +destination+:: The log destination (file, or STDOUT).
    def initialize(destination: 'STDOUT')
      @level = INFO

      # Set the default formatter.
      @formatter = proc do |severity, datetime, _progname, msg|
        iso8601_format = datetime.strftime('%Y-%m-%dT%H:%M:%S%:z')
        "[#{iso8601_format}] #{severity}: #{msg}\n"
      end

      # Set the log output destination.
      output(destination: destination)
    end

    # Set the log destination.
    # Params:
    # +destination+:: Requested log destination (STDOUT, STDERR, or filepath).
    def output(destination: 'STDERR')
      case destination
      when 'STDERR'
        @logdev = Logger::LogDevice.new(STDERR)
      when 'STDOUT'
        @logdev = Logger::LogDevice.new(STDOUT)
      else
        @logdev = Logger::LogDevice.new(destination)
      end
    end
  end
end
