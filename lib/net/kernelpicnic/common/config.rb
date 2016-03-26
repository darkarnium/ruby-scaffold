require 'yaml'

module Net
  module KernelPicnic
    module Common
      # Provides a central configuration class for use between projects. Allows for configuration
      # of the given project using YAML configuration files.
      class Config
        private

        attr_accessor :directive

        public

        # Attempts to load the given configuration file.
        # Params:
        # +file+:: Configuration file path to load.
        def load(file)
          raise 'No configuration file path provided' if file.empty?

          # Ensure the configuration exists and is readable.
          unless File.exist?(file)
            raise "Unable to locate configuration file at: #{file}"
          end

          # Attempt to load the YAML file.
          begin
            config_yaml = YAML.load_file(file)
          rescue => e
            raise e
          end

          # Ensure all keys are symbols.
          begin
            @directive = symbolize_keys(config_yaml)
          rescue => e
            raise e
          end
        end

        # Recursively converts all keys in a given hash to symbols.
        # Params:
        # +in_hash+:: Hash to symbolize.
        def symbolize_keys(in_hash = {})
          symbolized = {}

          # Iterate over entries and recurse if N dimension is a Hash.
          in_hash.each do |k, v|
            symbolized[k.to_sym] = v.is_a?(Hash) ? symbolize_keys(v) : symbolized[k.to_sym] = v
          end
          symbolized
        end

        # Allow for accessing the configuration like a Hash.
        # Params:
        # +key+:: The key to access.
        def [](key)
          @directive[key]
        end
      end
    end
  end
end
