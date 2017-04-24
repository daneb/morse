require 'yaml'
require 'providers/poro'
require 'helpers/configuration'

module Morse
  module Providers
    module DataProvider
      def lookup(key)
        config = Morse::Helpers::Configuration.load_config
        @data_access = Object.const_get(config['datasource']['type']).new
        @data_access.query(key)
      end
    end
  end
end