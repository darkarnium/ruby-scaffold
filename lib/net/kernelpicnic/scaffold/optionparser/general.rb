module Net
  module KernelPicnic
    module Scaffold
      module OptionParser
        # Defines a general command line argument parser for Meteor.
        class General < Net::KernelPicnic::Common::OptionParser
          # Setup the 'general' OptionParser, including defaults.
          # Params:
          # +args+:: Hash of arguments.
          def initialize
            @options = {
              # TODO: This is horrible.
              config_file: File.join(
                File.dirname(File.realpath(__FILE__)),
                '../../../../../bin/scaffold.yaml'
              )
            }

            # Setup the parser, calling the Ruby OptionParser object (thus the proceeding ::)
            @parser = ::OptionParser.new do |o|
              o.on('-C [CONFIG]', 'Path to the Scaffold configuration YAML') do |c|
                @options[:config_file] = c
              end
            end
          end
        end
      end
    end
  end
end
