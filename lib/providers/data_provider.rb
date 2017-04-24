require 'yaml'
require 'providers/poro'
require 'helpers/configuration'

module Morse
  module Providers
    module DataProvider
      def morse_lookup(key)
        config = Morse::Helpers::Configuration.load_config
        @data_access = Object.const_get(config['datasource']['type']).new
        @data_access.query_morse(key)
      end

      def dash_lookup(key)
        config = Morse::Helpers::Configuration.load_config
        @data_access = Object.const_get(config['datasource']['type']).new
        @data_access.query_dash(key)
      end
    end
  end
end