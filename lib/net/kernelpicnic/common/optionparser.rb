require 'optparse'

module Net
  module KernelPicnic
    module Common
      # Defines a command line argument parser.
      class OptionParser
        private

        attr_accessor :parser
        attr_accessor :options

        public

        # Setup OptionParser, including defaults.
        # Params:
        # +args+:: Hash of arguments.
        def initialize
          @options = {}
          @parser = ::OptionParser.new
        end

        # Parse command line arguments.
        # Params:
        # +args+:: Hash of command line arguments.
        def parse(args = {})
          @parser.parse(args)
        rescue => e
          raise e
        end

        # Allow for accessing options like a Hash.
        # Params:
        # +key+:: The key to access.
        def [](key)
          @options[key]
        end
      end
    end
  end
end
