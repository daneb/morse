require 'providers/poro'

module Morse
  module Providers
    module DataProvider
      def lookup(key)
        @data_access = Object.const_get('Morse::Providers::Poro').new
        @data_access.query(key)
      end
    end
  end
end