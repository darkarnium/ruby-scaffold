require 'yaml'

module Scaffold
  # Provides a central configuration class for use between projects. Allows for
  # configuration of the given project using YAML configuration files.
  class Config
    private

    attr_accessor :directive

    public

    # Constructor for configuration object.
    # Params:
    # +file+:: Configuration file path to load.
    def initialize(file)
      load(file)
    end

    # Attempts to load the given configuration file.
    # Params:
    # +file+:: Configuration file path to load.
    def load(file)
      raise 'No configuration file path provided' if file.empty?
      unless File.exist?(file)
        raise "Unable to locate configuration file at: #{file}"
      end

      # Attempt to load the YAML file and ensure all keys are symbols.
      begin
        @directive = symbolize_keys(YAML.load_file(file))
      rescue StandardError => err
        raise err
      end
    end

    # Recursively converts all keys in a given hash to symbols.
    # Params:
    # +in_hash+:: Hash to symbolize.
    def symbolize_keys(in_hash = {})
      symbolized = {}

      # Iterate over entries and recurse if N dimension is a Hash.
      in_hash.each do |key, value|
        if value.is_a?(Hash)
          symbolized[key.to_sym] = symbolize_keys(value)
        else
          symbolized[key.to_sym] = value
        end
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
