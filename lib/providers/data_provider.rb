require 'yaml'
require 'providers/poro'
require 'byebug'

module Morse
  module Providers
    module DataProvider
      def lookup(key)
        byebug
        config = YAML::load_file('config/environment.yml')
        @data_access = Object.const_get(config['datasource']['type']).new
        @data_access.query(key)
      end
    end
  end
end