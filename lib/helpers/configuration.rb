module Morse
  module Helpers
    module Configuration
      def self.load_config
        error_message = 'Cannot find configuration file' 
        raise IOError, error_message unless File.exist?('config/environment.yml')
        YAML.load_file 'config/environment.yml'
      end
    end
  end
end

